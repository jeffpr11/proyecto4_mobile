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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.5),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                minRadius: 60.0,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: NetworkImage(
                                    userInfo!.profileImage!,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  buildReadOnlyText(
                                      userInfo!.firstName!, 'Nombres'),
                                  buildReadOnlyText(
                                      userInfo!.lastName!, 'Apellidos'),
                                ],
                              ),
                              Row(
                                children: [
                                  buildReadOnlyText(
                                      userInfo!.email!, 'Correo eléctronico'),
                                  buildReadOnlyText(
                                      userInfo!.cardId!, 'Cédula'),
                                ],
                              ),
                              Row(
                                children: [
                                  buildReadOnlyText(userInfo!.bornDate!,
                                      'Fecha de nacimiento'),
                                  buildReadOnlyText(userInfo!.work!, 'Trabajo'),
                                ],
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(350),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.5),
                                    child: Text('Información de contacto',
                                        textScaleFactor: 1.1,
                                        style: TextStyle(
                                          color: Color.fromARGB(100, 0, 0, 0),
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Row(
                                children: [
                                  buildEditingText(
                                      phoneCtrl,
                                      "Actualiza telefono",
                                      _phoneVld ? null : "Teléfono inválido",
                                      'Celular'),
                                  buildEditingText(
                                      addressCtrl,
                                      "Actualiza dirección",
                                      _addressVld
                                          ? null
                                          : "Dirección muy corta",
                                      'Dirección'),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                                width: getProportionateScreenWidth(350),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
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
                            ),
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
        username: resUserData.data['user_details']['username'],
        profileImage: resUserData.data['profile_image'],
        work: resUserData.data['work'],
      );
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
        final Response res =
            await dioConst.put('$kUrl/user/profile/${userInfo!.id}/',
                options: Options(headers: {
                  "Authorization": "Bearer $tkn",
                }),
                data: {
              'tel_1': phoneCtrl.text,
              'address': addressCtrl.text,
            });
        if (res.statusCode == 200) {
          feedback(context, "Actualización exitosa.");
        } else {
          feedback(context, "Actualización fallida.");
        }
      } catch (e) {
        debugPrint(e.toString());
        feedback(context, "Actualización fallida.");
      }
    }
  }

  Future<void> feedback(BuildContext context, String msg) async {
    SnackBar snackbar = SnackBar(content: Text(msg));
    await getUsrInfo();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  buildReadOnlyText(String? txt1, String label) {
    return Expanded(
      child: ListTile(
        title: Text(
          txt1!,
          textScaleFactor: 0.9,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          label,
          textScaleFactor: 0.9,
        ),
      ),
    );
  }

  buildEditingText(
      TextEditingController ctrlr, String txt, String? valid, String label) {
    return Expanded(
      child: ListTile(
        title: SizedBox(
          width: getProportionateScreenWidth(200),
          child: TextField(
            controller: ctrlr,
            style: TextStyle(
              fontSize: getProportionateScreenHeight(13),
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(0),
              border: InputBorder.none,
              hintText: txt,
              errorText: valid,
            ),
          ),
        ),
        subtitle: Text(
          label,
          textScaleFactor: 0.9,
        ),
      ),
    );
  }
}
