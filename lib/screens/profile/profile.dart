import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'profile_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? userInfo;
  String? name = "John";
  String? lastname = "Doe";
  String? email = "jdoe@mail.com";
  String? id = "9999999999";
  String? birthdate = "mm/dd/yyyy";
  String? phone = "+593999999999";
  String? address = "Guayaquil";
  final alertController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // getUsrInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomScrollView(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Nombres:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                name!,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.black26,
                            onPressed: () {
                              showAlertDialog(context, "Nombres");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Apellidos:",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                lastname!,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.black26,
                            onPressed: () {
                              showAlertDialog(context, "Nombres");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Correo Electrónico:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                email!,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.black26,
                            onPressed: () {
                              showAlertDialog(context, "Nombres");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Cédula:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                id!,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.black26,
                            onPressed: () {
                              showAlertDialog(context, "Nombres");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Fecha de nacimiento:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                birthdate!,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.black26,
                            onPressed: () {
                              showAlertDialog(context, "Nombres");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Teléfono:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                phone!,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.black26,
                            onPressed: () {
                              showAlertDialog(context, "Nombres");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Dirección:",
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                              showAlertDialog(context, "Nombres");
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
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {},
                      child: const Text('CERRAR SESION'),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor, // background
                        onPrimary: Colors.white, // foreground
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
      ),
    );
  }

  /*Future<void> getUsrInfo() async {
    var usrId = await UserSecureStorage.getUserId();
    try {
      final Response resUserData = await dioConst.get(
        '$kUrl/user/profile/$usrId/',
      );
      setState(() {
        userInfo = User(
            id: resUserData.data['id'],
            firstName: resUserData.data['user_data']['first_name'],
            lastName: resUserData.data['user_data']['last_name'],
            email: resUserData.data['user_data']['email'],
            cardId: resUserData.data['card_id'],
            bornDate: resUserData.data['born_date'],
            cellphone: resUserData.data['cellphone']);
            address: resUserData.data['address'],
            username: resUserData.data['user_data']['username'],
      });
      debugPrint(resUserData.data.toString());
      setState(() {
        name = '${userInfo!.firstName} ${userInfo!.lastName}';
        phone = userInfo!.cellphone;
        email = userInfo!.email;
        id = userInfo!.cardId;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }*/

  showAlertDialog(BuildContext context, var entrada) {
    // set up the buttons
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        debugPrint(alertController.text);

        alertController.text = '';
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

  /*Future<void> updateField() async {
    debugPrint(userInfo.toString());
    debugPrint('$kUrl/user/profile/${userInfo!.id!}/');
    try {
      final Response response =
      await dioConst.put('$kUrl/user/intern/${userInfo!.id}/', data: {
        'born_date': userInfo!.bornDate,
        'first_name': userInfo!.firstName,
        'last_name': userInfo!.lastName,
        'email': userInfo!.email,
        'card_id': userInfo!.cardId,
        'address': userInfo!.address!,
        'cellphone': userInfo!.cellphone,
        'username': userInfo!.username,
      });
      await getUsrInfo();
    } catch (e) {
      debugPrint(e.toString());
    }
  }*/
}
