// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';

class Resource extends StatefulWidget {
  const Resource({Key? key}) : super(key: key);

  @override
  ResourceState createState() => ResourceState();
}

class ResourceState extends State<Resource> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
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
                      'Recursos del ministerio 1',
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
                physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                shrinkWrap: true, // You won't see infinite size error
                children:
                List.generate(20, (index) {
                  return
                    Column(
                      children: [
                        Image(
                          height: getProportionateScreenHeight(isPortrait ? 90 : 190),
                          image: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                          ),
                        ),
                        Text(
                          'Item $index',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(7.5),
                        ),
                      ],
                    );
                }),
              ),
            ),
          ],
        )
            : const Cargando());
  }
}
