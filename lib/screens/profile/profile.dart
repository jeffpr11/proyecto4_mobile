// import 'package:dio/dio.dart';
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
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Nombres:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userInfo!.firstName!,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Apellidos:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userInfo!.lastName!,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Correo Electrónico:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userInfo!.email!,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Cédula:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userInfo!.cardId!,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Fecha de nacimiento:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userInfo!.bornDate!,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Teléfono:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(200),
                                    child: TextField(
                                      controller: phoneCtrl,
                                      decoration: InputDecoration(
                                          hintText: "Actualiza telefono",
                                          errorText: _phoneVld
                                              ? null
                                              : "Teléfono debe tener 10 dígitos"),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Dirección:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(200),
                                    child: TextField(
                                      controller: addressCtrl,
                                      decoration: InputDecoration(
                                          hintText: "Actualiza dirección",
                                          errorText: _addressVld
                                              ? null
                                              : "Dirección muy corta"),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
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
      setState(() {
        loading = true;
      });
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
            const SnackBar(content: Text("Perfile actualizado"));
        await getUsrInfo();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
