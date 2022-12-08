import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';

class Resource extends StatefulWidget {
  const Resource({Key? key}) : super(key: key);

  @override
  _ResourceState createState() => _ResourceState();
}

class _ResourceState extends State<Resource> {
  bool loading = true;
  // List<Internship> internships = [];
  // List<Widget> contenido = [];

  @override
  void initState() {
    super.initState();
    // getInternships();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: !loading
            ? CustomScrollView(slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //     height: getProportionateScreenHeight(40),
                      //     width: getProportionateScreenWidth(210),
                      //     child: DefaultInput(
                      //         controller: searchController,
                      //         isContrasena: false,
                      //         label: 'Buscar...')),
                      // TextButton.icon(
                      //     onPressed: buildList,
                      //     icon: Icon(
                      //       Icons.search,
                      //       color: kDisableColor,
                      //     ),
                      //     label: Text(''))
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(290),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: const Text(
                        'Resultados',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  // Column(
                  //   children: contenido,
                  // )
                ],
              ))
        ])
            : Cargando());
  }
}
