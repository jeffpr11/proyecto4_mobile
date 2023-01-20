import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/screens/login/login_form.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    SizeData().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Centro Cristiano de Guayaquil",
          textScaleFactor: 1.15,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kSecondaryColor,
      ),
      body: SizedBox(
          width: double.infinity,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: _botones(),
                ))
          ])),
    );
  }

  List<Widget> _botones() {
    return [
      SizedBox(
        height: getProportionateScreenHeight(60),
      ),
      const Text(
        "INICIO DE SESION",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: getProportionateScreenHeight(100),
      ),
      SizedBox(
        height: getProportionateScreenHeight(730),
        child: FormularioLogin(
          usuarioController: usuarioController,
          contrasenaController: contrasenaController,
          formKey: _formKey,
        ),
      ),
    ];
  }
}
