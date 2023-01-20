import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_data.dart';

class DefaultButton extends StatelessWidget {
  final Function func;
  final String label;
  final Color colorBg;
  final Color colorTxt;

  const DefaultButton({
    required this.label,
    required this.func,
    this.colorBg = kSecondaryColor,
    this.colorTxt = kPrimaryLightColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(20))),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(colorBg),
            minimumSize: MaterialStateProperty.all<Size>(Size(
                getProportionateScreenHeight(250),
                getProportionateScreenHeight(50)))),
        onPressed: func as void Function(),
        child: Text(
          label,
          textScaleFactor: 1.3,
          style: TextStyle(
            color: colorTxt,
          ),
        ));
  }
}
