import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'const.dart';
import 'models/coffee.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/menu.dart';
import 'screens/menu_detail.dart';
import 'screens/splash.dart';

class LoginInfo extends ChangeNotifier {
  var _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

final loginInfo = LoginInfo();

Coffee _coffeeFrom(String s) {
  return coffees.where((coffee) => coffee.id.toString() == s).first;
}

final router = GoRouter(
  // redirect: (GoRouterState state) {
  //   final loggedIn = loginInfo.isLoggedIn;
  //   final isLogging = state.location == '/login';
  //   if (!loggedIn && !isLogging) return '/login';
  //   if (loggedIn && isLogging) return '/';
  //   return null;
  // },
  refreshListenable: loginInfo,
  urlPathStrategy: UrlPathStrategy.path,
  debugLogDiagnostics: false,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      name: 'spalsh',
      path: '/splash',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) {
        final scaffoldKey = state.extra;
        return MaterialPage(
          key: state.pageKey,
          child: LoginScreen(
            scaffoldKey: scaffoldKey,
          ),
        );
      },
    ),
    GoRoute(
      name: 'menu',
      path: '/menu',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const MenuScreen(),
      ),
      routes: [
        GoRoute(
          name: 'details',
          path: ':id', // e.g. /menu/1002
          pageBuilder: (context, state) {
            final coffee = _coffeeFrom(state.params['id']!);
            return MaterialPage(
              key: state.pageKey,
              child: MenuDetails(coffee: coffee),
            );
          },
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
