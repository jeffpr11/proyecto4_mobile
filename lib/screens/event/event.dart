// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';
import 'package:proyecto4_mobile/user_storage.dart';
import 'event_card.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  EventState createState() => EventState();
}

class EventState extends State<Event> {
  bool loading = true;
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
                              'Próximos eventos',
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
    try {
      final Response res = await dioConst.get('$kUrl/events/event/',
          options: Options(headers: {
            "Authorization": "Bearer $tkn",
          }));
      for (var e in res.data['results']) {
        var desc = e['description'];
        desc = desc.length > 95 ? "${desc.substring(0, 95)}..." : desc;
        resL.add(EventCard(
            id: e['id'],
            name: e['name'],
            description: desc,
            date: e['date_start'].substring(0, 10),
            route: e['event_image']));
      }
      contenido = resL;
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
