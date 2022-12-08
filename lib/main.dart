import 'package:flutter/material.dart';
import 'package:proyecto4_mobile/routes/router.gr.dart';

import 'constants.dart';

final _appRouter = AppRouter();

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp.router(
        debugShowCheckedModeBanner: false,
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
