// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/size_data.dart';
import 'package:proyecto4_mobile/user_storage.dart';
import 'package:proyecto4_mobile/defaults/default_loading.dart';
import 'group_model.dart';

class Group extends StatefulWidget {
  const Group({Key? key}) : super(key: key);

  @override
  GroupState createState() => GroupState();
}

class GroupState extends State<Group> {
  bool loading = true;
  GroupM? groupInfo;

  @override
  void initState() {
    super.initState();
    getGroupInfo();
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
                      children: [
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
                            child: Text(
                              groupInfo!.name!,
                              textScaleFactor: 1.3,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(7.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(150),
                                width: getProportionateScreenWidth(375),
                                child: Image(
                                  image: NetworkImage(
                                    groupInfo!.image!,
                                  ),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Card(
                                elevation: 0,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.only(
                                      left: 0.0, right: 0.0),
                                  subtitle: Text(
                                    groupInfo!.description!,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              const Text(
                                'Líder',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image(
                                        height:
                                            getProportionateScreenHeight(120),
                                        image: NetworkImage(
                                          groupInfo!.leaderImage!,
                                        ),
                                      ),
                                      Text(
                                        groupInfo!.leader!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Cargando());
  }

  Future<void> getGroupInfo() async {
    var tkn = await UserSecureStorage.getToken();
    var tmp = await UserSecureStorage.getGroupId();
    try {
      final Response res = await dioConst.get('$kUrl/organizations/group/$tmp/',
          options: Options(headers: {
            "Authorization": "Bearer $tkn",
          }));

      var leader = res.data['leader_details'];
      groupInfo = GroupM(
          id: res.data['id'],
          name: res.data['name'],
          description: res.data['description'],
          leader: leader['user_details']['first_name'],
          leaderImage: "$kBaseUrl${leader['profile_image']}",
          image: "$kBaseUrl${res.data['group_image']}");
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
