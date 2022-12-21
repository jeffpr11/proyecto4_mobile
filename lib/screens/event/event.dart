// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';

import 'event_card.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  EventState createState() => EventState();
}

class EventState extends State<Event> {
  bool loading = false;
  List<Widget> contenido = [];

  @override
  void initState() {
    super.initState();
    buildList();
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

  void buildList() {
    List<Widget> res = [];
    setState(() {
      contenido = [];
    });
    for (int i = 1; i <= 20; i++) {
      res.add(EventCard(
          id: i,
          name: "name $i",
          description:
              "desc asdfghj asdfqwera adsd astry. Lorem Ipsum has been the industrys standard dummy. $i",
          date: "m$i/d$i/yyy$i"));
    }
    setState(() {
      contenido = res;
    });
  }
}
