import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/routes/router.gr.dart';

import 'constants.dart';

final _appRouter = AppRouter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp.router(
        theme: ThemeData(
          primaryColor: kPrimaryLightColor,
          scaffoldBackgroundColor: kPrimaryLightColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
