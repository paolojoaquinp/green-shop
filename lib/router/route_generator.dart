import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:green_shop/ui/pages/home_page.dart';
import 'package:green_shop/ui/pages/page_404.dart';



class RouteGenerator {

  static Route<dynamic> generateRoute( RouteSettings settings ) {

    switch( settings.name ) {

      case '/home':
        return _fadeRoute( HomePage(), '/home' );
      
/*       case '/provider':
        return _fadeRoute( CounterProviderView(), '/provider' ); */

      default:
        return _fadeRoute( Page404(), '/404' );
    }
  }

  static PageRoute _fadeRoute( Widget child, String routeName ) {


    return PageRouteBuilder(
      settings: RouteSettings(name:  routeName ),
      pageBuilder: ( _, __, ___ ) => child,
      transitionDuration: Duration( milliseconds: 200 ),
      transitionsBuilder: ( _, animation, __, ___ ) => 
        (kIsWeb) 
        ? FadeTransition(
            opacity: animation,
            child: child,
          )
        : CupertinoPageTransition(primaryRouteAnimation: animation, secondaryRouteAnimation: __, child: child, linearTransition: true)
    );

  }

}

