import 'package:flutter/material.dart';
import '../constants.dart';

class Cargando extends StatelessWidget {
  const Cargando({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: kSecondaryColor,
      ),
    );
  }
}
