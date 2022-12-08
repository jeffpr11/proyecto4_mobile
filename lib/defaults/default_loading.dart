import 'package:flutter/material.dart';
import '../constants.dart';

class Cargando extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}