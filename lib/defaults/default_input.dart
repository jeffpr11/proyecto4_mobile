import 'package:flutter/material.dart';
import '../size_data.dart';

class DefaultInput extends StatelessWidget {
  final TextEditingController controller;
  final Function? validacion;
  final bool isContrasena;
  final String label;
  const DefaultInput(
      {required this.controller,
        this.validacion,
        required this.isContrasena,
        required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validacion as String? Function(String?)?,
      controller: controller,
      obscureText: isContrasena,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF2F6F5),
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(10),
              horizontal: getProportionateScreenHeight(5))),
    );
  }
}