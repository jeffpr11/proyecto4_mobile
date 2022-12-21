// import 'package:dio/dio.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/routes/router.gr.dart';
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
  String? name = "John";
  String? lastname = "Doe";
  String? email = "jdoe@mail.com";
  String? id = "9999999999";
  String? birthdate = "mm/dd/yyyy";
  String? phone_1 = "+593999999999";
  String? address = "Guayaquil";

  TextEditingController dateController = TextEditingController();
  final alertController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
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
                                        name!,
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
                                        lastname!,
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
                                        email!,
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
                                        id!,
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
                                        birthdate!,
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
                                        "Teléfono:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        phone_1!,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black26,
                                    onPressed: () {
                                      showAlertDialog(
                                          context, "teléfono", phone_1!);
                                    },
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
                                        "Dirección:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        address!,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: Colors.black26,
                                    onPressed: () {
                                      showAlertDialog(
                                          context, "dirección", address!);
                                    },
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
                              onPressed: () {},
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
    try {
      final Response resUserData = await dioConst.get(
        '$kUrl/user/profile/$usrId/',
      );
      setState(() {
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
        name = userInfo!.firstName;
        lastname = userInfo!.lastName;
        phone_1 = userInfo!.phone_1;
        email = userInfo!.email;
        id = userInfo!.cardId;
        birthdate = userInfo!.bornDate;
        address = userInfo!.address;

        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  showAlertDialog(BuildContext context, var entrada, String txt) {
    // set up the buttons
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        setState(() {
          alertController.text = txt;
        });
        debugPrint(alertController.text);
        // updateField();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Ingrese $entrada: "),
      content: TextFormField(controller: alertController),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> updateField() async {
    debugPrint(userInfo.toString());
    debugPrint('$kUrl/user/profile/${userInfo!.id!}/');
    try {
      final Response response =
          await dioConst.put('$kUrl/user/intern/${userInfo!.id}/', data: {
        'address': userInfo!.address!,
        'cellphone': userInfo!.phone_1,
      });
      await getUsrInfo();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
