// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../screens/event/event_detail.dart' as _i3;
import '../screens/group/group.dart' as _i4;
import '../screens/home/home.dart' as _i2;
import '../screens/login/login.dart' as _i1;
import '../screens/profile/profile.dart' as _i7;
import '../screens/record/record.dart' as _i6;
import '../screens/resource/resource.dart' as _i5;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Login(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Home(),
      );
    },
    EventDetailRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailRouteArgs>(
          orElse: () => const EventDetailRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.EventDetail(
          key: args.key,
          id: args.id,
        ),
      );
    },
    GroupRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.Group(),
      );
    },
    ResourceRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.Resource(),
      );
    },
    RecordRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.Record(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.Profile(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i8.RouteConfig(
          EventDetailRoute.name,
          path: '/event',
        ),
        _i8.RouteConfig(
          GroupRoute.name,
          path: '/group',
        ),
        _i8.RouteConfig(
          ResourceRoute.name,
          path: '/resource',
        ),
        _i8.RouteConfig(
          RecordRoute.name,
          path: '/record',
        ),
        _i8.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
      ];
}

/// generated route for
/// [_i1.Login]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.Home]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.EventDetail]
class EventDetailRoute extends _i8.PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({
    _i9.Key? key,
    int? id,
  }) : super(
          EventDetailRoute.name,
          path: '/event',
          args: EventDetailRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'EventDetailRoute';
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({
    this.key,
    this.id,
  });

  final _i9.Key? key;

  final int? id;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.Group]
class GroupRoute extends _i8.PageRouteInfo<void> {
  const GroupRoute()
      : super(
          GroupRoute.name,
          path: '/group',
        );

  static const String name = 'GroupRoute';
}

/// generated route for
/// [_i5.Resource]
class ResourceRoute extends _i8.PageRouteInfo<void> {
  const ResourceRoute()
      : super(
          ResourceRoute.name,
          path: '/resource',
        );

  static const String name = 'ResourceRoute';
}

/// generated route for
/// [_i6.Record]
class RecordRoute extends _i8.PageRouteInfo<void> {
  const RecordRoute()
      : super(
          RecordRoute.name,
          path: '/record',
        );

  static const String name = 'RecordRoute';
}

/// generated route for
/// [_i7.Profile]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}
