import 'package:flutter/material.dart';

class Routes {
  static Route createHorizontalRoute(Widget page2) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page2,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route createVerticalRoute(Widget page2) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page2,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
