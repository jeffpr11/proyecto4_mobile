import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';
import 'package:proyecto4_mobile/user_storage.dart';

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  RecordState createState() => RecordState();
}

class RecordState extends State<Record> {
  bool loading = false;
  List<Widget> contenido = [];

  @override
  void initState() {
    super.initState();
    buildListRes();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: !loading
            ? CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(350),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: const Text(
                              'Historial',
                              textScaleFactor: 1.3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(7.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.5),
                          child: Column(
                            children: contenido,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Cargando());
  }

  Future<void> buildListRes() async {
    List<Widget> resL = [];
    var tkn = await UserSecureStorage.getToken();
    var usrId = await UserSecureStorage.getUserId();
    var tmp = await UserSecureStorage.getGroupId();
    try {
      final Response res = await dioConst.get(
          '$kUrl/organizations/history/?member=$usrId&group=$tmp',
          options: Options(headers: {
            "Authorization": "Bearer $tkn",
          }));
      for (var e in res.data['2']) {
        resL.add(buildRecords(
            Icons.upload_file,
            kPrimaryColor,
            "Documento compartido!",
            "${e['date_modified']} - Compartió documento!",
            "${e['user_creator']} compartió ${e['name']}"));
      }
      var grupo = res.data['1'];
      resL.add(buildRecords(
          Icons.person_add_alt,
          kSuccessColor,
          "Fuiste agregado!",
          "${grupo['date_modified']} - Fuiste agregado!",
          "${grupo['user_creator']} te agregó a ${grupo['name']}"));
      setState(() {
        contenido = resL;
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  buildRecords(IconData icon, Color icolor, String txtIcon, String txtTitle,
      String txtBody) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: kSecondaryColorGradient,
          child: ListTile(
            leading: Icon(
              icon,
              color: icolor,
              size: 40.0,
              semanticLabel: txtIcon,
            ),
            title: Text(txtTitle),
            subtitle: Text(txtBody),
          ),
        ),
      ),
    );
  }
}
