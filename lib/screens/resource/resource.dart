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

  @override
  void initState() {
    super.initState();
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
                        'RECURSOS',
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
                      children: [
                        /* CONTENIDO */
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
            : Cargando());
  }
}
