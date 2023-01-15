import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/user_storage.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';
import 'profile_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool loading = true;
  User? userInfo;
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  RegExp regExp = RegExp(r"^09[0-9]{8}$");
  bool _phoneVld = true;
  bool _addressVld = true;

  @override
  void initState() {
    super.initState();
    getUsrInfo();
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                            child: const Text('Perfil',
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.5),
                          child: Column(
                            children: [
                              readOnlyTextField(
                                  "Nombres", userInfo!.firstName!),
                              readOnlyTextField(
                                  "Apellidos", userInfo!.lastName!),
                              readOnlyTextField("Email", userInfo!.email!),
                              readOnlyTextField("Cédula", userInfo!.cardId!),
                              readOnlyTextField(
                                  "Fecha de nacimiento", userInfo!.bornDate!),
                              buildTextField(
                                  "Teléfono",
                                  phoneCtrl,
                                  "Actualiza telefono",
                                  _phoneVld ? null : "Teléfono inválido"),
                              buildTextField(
                                  "Dirección",
                                  addressCtrl,
                                  "Actualiza dirección",
                                  _addressVld ? null : "Dirección muy corta"),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('CERRAR SESION'),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(20),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor, // background
                              ),
                              onPressed: () {
                                update();
                              },
                              child: const Text('GUARDAR CAMBIOS'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Cargando());
  }

  Future<void> getUsrInfo() async {
    var usrId = await UserSecureStorage.getUserId();
    var tkn = await UserSecureStorage.getToken();
    try {
      final Response resUserData =
          await dioConst.get('$kUrl/user/profile/$usrId/',
              options: Options(headers: {
                "Authorization": "Bearer $tkn",
              }));
      userInfo = User(
          id: resUserData.data['id'],
          firstName: resUserData.data['user_details']['first_name'],
          lastName: resUserData.data['user_details']['last_name'],
          email: resUserData.data['user_details']['email'],
          cardId: resUserData.data['card_id'],
          bornDate: resUserData.data['born_date'],
          phone_1: resUserData.data['tel_1'],
          address: resUserData.data['address'],
          username: resUserData.data['user_details']['username']);
      phoneCtrl.text = userInfo!.phone_1!;
      addressCtrl.text = userInfo!.address!;
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> update() async {
    setState(() {
      _phoneVld = phoneCtrl.text.trim().length != 10 || phoneCtrl.text.isEmpty
          ? false
          : true;
      _addressVld =
          addressCtrl.text.trim().length < 3 || addressCtrl.text.isEmpty
              ? false
              : true;
    });
    if (_phoneVld && _addressVld) {
      var tkn = await UserSecureStorage.getToken();
      try {
        final Response response =
            await dioConst.put('$kUrl/user/profile/${userInfo!.id}/',
                options: Options(headers: {
                  "Authorization": "Bearer $tkn",
                }),
                data: {
              'tel_1': phoneCtrl.text,
              'address': addressCtrl.text,
            });
        SnackBar snackbar =
            const SnackBar(content: Text("Perfil actualizado"));
        await getUsrInfo();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  readOnlyTextField(String text1, String? text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$text1:",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: getProportionateScreenWidth(200),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: text2,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
      ],
    );
  }

  buildTextField(
      String label, TextEditingController txtCtrl, String hint, String? valid) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label:",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: getProportionateScreenWidth(200),
          child: TextField(
            controller: txtCtrl,
            decoration: InputDecoration(hintText: hint, errorText: valid),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
      ],
    );
  }
}
