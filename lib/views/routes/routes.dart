import 'package:flutter/material.dart';
import 'package:sport_app/views/routes/routes_name.dart';
import 'package:sport_app/views/screens/LandingPages/Landing.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landing:
        return _pageAnimatedRoute(Landing(), settings);
      // default
      default:
        return _pageAnimatedRoute(Landing(), settings);
    }
  }

  /// Create Custom Transition for Navigation
  static Route<dynamic> _pageAnimatedRoute(
      Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  /// Navigation Without Transition (Animtaion)
  static Route<dynamic> _pageSimpleRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, _, __) => page,
    );
  }

  ///Navigation With IOS Transition
  /*static Route<dynamic> _pageCupertino(Widget page, RouteSettings settings) {
    return CupertinoPageRoute(builder: (_) => page, settings: settings);
  }*/
}
