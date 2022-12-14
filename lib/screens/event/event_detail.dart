// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';

class EventDetail extends StatefulWidget {
  int? id;

  EventDetail({super.key, this.id});

  @override
  EventDetailState createState() => EventDetailState();
}

class EventDetailState extends State<EventDetail> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Evento TITULO',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
            ),
            body: SizedBox(
                child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: getProportionateScreenHeight(20),
                      // ),
                      // SizedBox(
                      //   width: getProportionateScreenWidth(350),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       border: Border(
                      //         bottom: BorderSide(color: Colors.grey.shade300),
                      //       ),
                      //     ),
                      //     child: const Text(
                      //       'Evento TITULO',
                      //       textScaleFactor: 1.3,
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         color: kPrimaryColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
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
                                  onPressed: () {
                                    /* LOGICA */
                                  },
                                  child: Text(
                                    'Lista de participantes: 20',
                                    textScaleFactor: 0.9,
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                  onPressed: () {
                                    /* LOGICA */
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
                                  "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it when an unknown printer took a galley of type and scrambled it when an unknown printer took a galley",
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            const Text(
                              'Comentarios',
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Card(
                              elevation: 0,
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(
                                    left: 0.0, right: 5.0),
                                leading: Image(
                                  image: NetworkImage(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                  ),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'widget.name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'widget.date',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Agrega tu comentario...',
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              maxLength: 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                  onPressed: () {
                                    /* LOGICA */
                                  },
                                  child: const Text(
                                    'Enviar',
                                    textScaleFactor: 0.9,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )
        : Scaffold(
            body: Cargando(),
          );
  }
}
