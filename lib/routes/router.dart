
import 'package:auto_route/auto_route.dart';
import 'package:proyecto4_mobile/screens/home/home.dart';
import 'package:proyecto4_mobile/screens/login/login.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: Login, path: "/", initial: true),
  MaterialRoute(page: Home, path: "/home"),

])
class $AppRouter {}