// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/screens/group/group_model.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';
import 'package:proyecto4_mobile/user_storage.dart';

import 'event_model.dart';

class EventDetail extends StatefulWidget {
  int? id;

  EventDetail({super.key, this.id});

  @override
  EventDetailState createState() => EventDetailState();
}

class EventDetailState extends State<EventDetail> {
  bool loading = true;
  EventM? eventInfo;
  List<Widget> registered = [];

  @override
  void initState() {
    buildDetail();
    getRegisteredList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                eventInfo != null ? eventInfo!.name! : 'Titulo',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: kSecondaryColor,
            ),
            body: SizedBox(
                child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Container(
                              height: getProportionateScreenHeight(150),
                              width: getProportionateScreenWidth(375),
                              child: Image(
                                image: NetworkImage(
                                  eventInfo!.route!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                  onPressed: buildDialog,
                                  child: Text(
                                    'Lista de participantes: ${eventInfo!.totalRecords}',
                                    textScaleFactor: 0.9,
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                  onPressed: () {
                                    registerInterest();
                                  },
                                  child: const Text(
                                    'Registrar asistencia',
                                    textScaleFactor: 0.9,
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              elevation: 0,
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                subtitle: Text(
                                  eventInfo!.description!,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            // const Text(
                            //   'Comentarios',
                            //   textScaleFactor: 1.1,
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // Card(
                            //   elevation: 0,
                            //   child: ListTile(
                            //     contentPadding: const EdgeInsets.only(
                            //         left: 0.0, right: 5.0),
                            //     leading: Image(
                            //       image: NetworkImage(
                            //         'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                            //       ),
                            //     ),
                            //     title: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Text(
                            //           'widget.name',
                            //           style: TextStyle(
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //         Text(
                            //           'widget.date',
                            //           style: TextStyle(
                            //             color: Colors.grey,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     subtitle: Text(
                            //       'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                            //       textAlign: TextAlign.justify,
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: getProportionateScreenHeight(10),
                            // ),
                            // TextField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(),
                            //     hintText: 'Agrega tu comentario...',
                            //   ),
                            //   keyboardType: TextInputType.multiline,
                            //   maxLines: 2,
                            //   maxLength: 80,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     TextButton(
                            //       style: TextButton.styleFrom(
                            //         backgroundColor: Colors.grey.shade200,
                            //       ),
                            //       onPressed: () {
                            //         /* LOGICA */
                            //       },
                            //       child: const Text(
                            //         'Enviar',
                            //         textScaleFactor: 0.9,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )
        : Cargando();
  }

  Future<void> buildDetail() async {
    var tkn = await UserSecureStorage.getToken();
    try {
      final Response res = await dioConst.get('$kUrl/events/event/${widget.id}',
          options: Options(headers: {
            "Authorization": "Bearer $tkn",
          }));
      eventInfo = EventM(
        id: res.data['id'],
        name: res.data['name'],
        description: res.data['description'],
        type: res.data['type'],
        startDate: res.data['date_start'],
        endDate: res.data['date_end'],
        route: res.data['img_details']['route'],
        totalRecords: res.data['total_records'],
      );
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> registerInterest() async {
    var tkn = await UserSecureStorage.getToken();
    var usrId = await UserSecureStorage.getUserId();
    try {
      setState(() {
        loading = true;
      });
      final Response res = await dioConst.post('$kUrl/events/record/',
          options: Options(headers: {
            "Authorization": "Bearer $tkn",
          }),
          data: {
            'event': widget.id,
            'user': usrId,
          });
      setState(() {
        loading = false;
      });
      if (res.statusCode == 200) {
        feedback(context, "Ya se encuentra registrado.");
      } else if (res.statusCode == 201) {
        feedback(context, "Registro exitoso.");
      } else {
        feedback(context, "Registro fallido.");
      }
    } catch (e) {
      debugPrint(e.toString());
      feedback(context, "Registro fallido.");
    }
  }

  Future<void> feedback(BuildContext context, String msg) async {
    SnackBar snackbar = SnackBar(content: Text(msg));
    await buildDetail();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  Future<void> getRegisteredList() async {
    var tkn = await UserSecureStorage.getToken();
    try {
      setState(() {
        registered = [];
      });
      final Response res =
          await dioConst.get('$kUrl/events/event/${widget.id}/profiles/',
              options: Options(headers: {
                "Authorization": "Bearer $tkn",
              }));
      var result = res.data;
      List<Widget> tmp = [];
      for (var r in result['results']) {
        var det = r['user_details'];
        var n = det['first_name'] + ' ' + det['last_name'];
        tmp.add(Text(n));
      }
      setState(() {
        registered = tmp;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void buildDialog() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lista de registrados'),
          content: SingleChildScrollView(
            child: ListBody(
              children: registered,
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
