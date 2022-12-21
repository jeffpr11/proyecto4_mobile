import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/defaults/default_button.dart';
import 'package:proyecto4_mobile/defaults/default_input.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';
import 'package:proyecto4_mobile/user_storage.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/routes/router.gr.dart';

import 'package:jwt_decode/jwt_decode.dart';

class FormularioLogin extends StatefulWidget {
  final TextEditingController usuarioController;
  final TextEditingController contrasenaController;
  final GlobalKey<FormState> formKey;
  const FormularioLogin(
      {Key? key,
      required this.usuarioController,
      required this.contrasenaController,
      required this.formKey})
      : super(key: key);

  @override
  FormularioLoginState createState() => FormularioLoginState();
}

class FormularioLoginState extends State<FormularioLogin> {
  bool recuerdame = false;
  bool loading = false;
  int userId = -9;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.usuarioController,
                  isContrasena: false,
                  label: "Usuario",
                  // validacion: Validator.validateUsername,
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: DefaultInput(
              controller: widget.contrasenaController,
              isContrasena: true,
              label: "Contraseña",
              // validacion: Validator.validateContrasena,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          // _recuerdame(),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          SizedBox(
            height: getProportionateScreenHeight(270),
            child: Column(
              children: [
                if (loading) const Cargando(),
                if (!loading)
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                    width: getProportionateScreenWidth(250),
                    child: DefaultButton(
                      func: () async => {
                        await logIn(context),
                        setState(() {
                          loading = false;
                        }),
                        if (userId != -9)
                          {AutoRouter.of(context).push(const HomeRoute())}
                      },
                      label: "Inicia Sesión",
                      colorBg: loading ? kDisableColor : kPrimaryColor,
                    ),
                  ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logIn(BuildContext context) async {
    setState(() {
      loading = true;
    });
    try {
      final Response response = await dioConst.post('$kUrl/token/', data: {
        'username': widget.usuarioController.text,
        'password': widget.contrasenaController.text
      });
      Map<String, dynamic> payload = Jwt.parseJwt(response.data['token']);
      setState(() {
        if (payload['profile_id'] == -1) {
          userId = -9;
        } else {
          userId = payload['profile_id'];
        }
      });
      UserSecureStorage.setToken(response.data['token'] as String);
      UserSecureStorage.setUserId(userId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Widget _recuerdame() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Checkbox(
  //           value: widget.recuerdame,
  //           activeColor: kPrimaryColor,
  //           onChanged: widget.recuerdameCallback as void Function(bool?)?),
  //       const Text("Recuerdame")
  //     ],
  //   );
  // }
}
