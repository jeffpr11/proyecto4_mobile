import 'package:auto_route/auto_route.dart';
import 'package:proyecto4_mobile/screens/login/login.dart';
import 'package:proyecto4_mobile/screens/home/home.dart';
import 'package:proyecto4_mobile/screens/event/event_detail.dart';
import 'package:proyecto4_mobile/screens/group/group.dart';
import 'package:proyecto4_mobile/screens/resource/resource.dart';
import 'package:proyecto4_mobile/screens/record/record.dart';
import 'package:proyecto4_mobile/screens/profile/profile.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: Login, path: "/", initial: true),
  MaterialRoute(page: Home, path: "/home"),
  MaterialRoute(page: EventDetail, path: "/event"),
  MaterialRoute(page: Group, path: "/group"),
  MaterialRoute(page: Resource, path: "/resource"),
  MaterialRoute(page: Record, path: "/record"),
  MaterialRoute(page: Profile, path: "/profile"),
])
class $AppRouter {}
