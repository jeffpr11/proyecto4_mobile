import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/constants.dart';
import 'package:proyecto4_mobile/screens/event/event.dart';
import 'package:proyecto4_mobile/screens/group/group.dart';
import 'package:proyecto4_mobile/screens/record/record.dart';
import 'package:proyecto4_mobile/screens/profile/profile.dart';
import 'package:proyecto4_mobile/screens/resource/resource.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int current = 0;

  final List<Widget> _screens = [
    const Event(),
    const Group(),
    const Resource(),
    const Record(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "LOGOTIPO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: _screens[current],
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        showUnselectedLabels: true,
        currentIndex: current,
        onTap: _navigationHandler,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined), label: 'Grupo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_outlined), label: 'Recursos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Historial'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ]);
  }

  void _navigationHandler(int newCurrent) {
    setState(() {
      current = newCurrent;
    });
  }
}
