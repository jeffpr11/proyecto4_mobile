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
  bool able = false;
  bool loading = false;
  int userId = -1;
  int groupId = -1;

  @override
  void initState() {
    super.initState();
    widget.usuarioController.addListener(validAble);
    widget.contrasenaController.addListener(validAble);
  }

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
                    child: able
                        ? DefaultButton(
                            func: () async => {
                              {
                                await logIn(context),
                                setState(() {
                                  loading = false;
                                }),
                                if ((userId != -1) && (groupId != -1))
                                  {
                                    AutoRouter.of(context)
                                        .push(const HomeRoute())
                                  }
                              }
                            },
                            label: "Iniciar Sesión",
                            colorBg: kPrimaryColor,
                          )
                        : DefaultButton(
                            func: () => {},
                            label: "Iniciar Sesión",
                            colorBg: kDisableColor,
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

  void validAble() {
    if (widget.usuarioController.text != '' &&
        widget.contrasenaController.text != '') {
      setState(() {
        able = true;
      });
    } else {
      setState(() {
        able = false;
      });
    }
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
        userId = payload['profile_id'];
      });
      String tkn = response.data['token'] as String;
      final Response res =
          await dioConst.get('$kUrl/organizations/group/?members=$userId',
              options: Options(headers: {
                "Authorization": "Bearer $tkn",
              }));
      var results = res.data['results'];
      if (results.length == 0) {
        setState(() {
          userId = -1;
          groupId = -1;
        });
        feedback(context, "No cuenta con grupo asignado.");
      } else {
        setState(() {
          groupId = results[0]['id'];
        });
        UserSecureStorage.setToken(tkn);
        UserSecureStorage.setUserId(userId);
        UserSecureStorage.setGroupId(groupId);
      }
    } on DioError catch (e) {
      setState(() {
        userId = -1;
        groupId = -1;
      });
      if (e.toString().contains('refuse')) {
        feedback(context, "Servidor sin conexión. Contacte administrador.");
      } else {
        var error = e.response!.toString();
        if (error.contains('members')) {
          if (!error.contains('-1')) {
            feedback(context, "Perfil no cuenta con grupo asociado.");
          }
          feedback(context, "No cuenta con perfil. Contacte administrador.");
        } else if (error.contains('credentials')) {
          feedback(context, "Credenciales incorrectas/No cuenta con usuario.");
        } else {
          feedback(context, "Algo salió mal. Contacte administrador.");
        }
      }
    }
  }

  feedback(BuildContext context, String msg) {
    SnackBar snackbar = SnackBar(content: Text(msg));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
