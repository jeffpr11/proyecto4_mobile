import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/user_storage.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class Resource extends StatefulWidget {
  const Resource({Key? key}) : super(key: key);

  @override
  ResourceState createState() => ResourceState();
}

class ResourceState extends State<Resource> {
  var icono = {
    'pdf': kdefaultIcons['pdf'],
    'doc': kdefaultIcons['word'],
    'docx': kdefaultIcons['word'],
    'xls': kdefaultIcons['excel'],
    'xlsx': kdefaultIcons['excel'],
    'ppt': kdefaultIcons['powerpoint'],
    'pptx': kdefaultIcons['powerpoint'],
  };

  bool loading = true;
  List contenido = [];

  @override
  void initState() {
    super.initState();
    getResources();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
        child: !loading
            ? ListView(
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(350),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: const Text(
                            'Recursos',
                            textScaleFactor: 1.3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(7.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.5),
                    child: GridView.count(
                      crossAxisCount: isPortrait ? 3 : 5,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: funcion(isPortrait, contenido),
                    ),
                  ),
                ],
              )
            : const Cargando());
  }

  Future<void> getResources() async {
    var tkn = await UserSecureStorage.getToken();
    var groupId = await UserSecureStorage.getGroupId();
    try {
      final Response res =
          await dioConst.get('$kUrl/organizations/resource/?groups=$groupId',
              options: Options(headers: {
                "Authorization": "Bearer $tkn",
              }));

      setState(() {
        contenido = res.data['results'];
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  funcion(var isPortrait, List? contenido) {
    List<Widget> res = [];
    for (var r in contenido!) {
      String route = r['route'];
      String format = route.split('.').last;
      String ico = getIcono(format);
      String name = r['name'];
      name = name.length > 32 ? "${name.substring(0, 32)}..." : name;
      res.add(
        Column(
          children: [
            TextButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              r['name'],
                              textScaleFactor: 1.15,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Creador: ${r['user_creator']}"),
                            ElevatedButton(
                              child: const Text('Abrir'),
                              onPressed: () {
                                getUrl(Uri.parse(route));
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image(
                  width: getProportionateScreenWidth(isPortrait ? 60 : 130),
                  height: getProportionateScreenHeight(isPortrait ? 60 : 130),
                  image: NetworkImage(ico),
                ),
              ),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }
    return res;
  }

  String getIcono(String format) {
    if (icono.containsKey(format)) {
      return icono[format]!;
    } else {
      return kdefaultIcons['default']!;
    }
  }

  Future<void> getUrl(Uri url) async {
    if (Platform.isAndroid) {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } else if (Platform.isIOS) {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }
  }
}
