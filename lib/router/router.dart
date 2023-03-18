
import 'package:fluro/fluro.dart';
import 'package:green_shop/ui/views/about_view.dart';
import 'package:green_shop/ui/views/character_view.dart';
import 'package:green_shop/ui/views/home_view.dart';
import 'package:green_shop/ui/views/view_404.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _homeHanlder,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/home',
      handler: _homeHanlder,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/character/:id',
      handler: _characterHanlder,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/about',
      handler: _aboutHandler,
      transitionType: TransitionType.fadeIn
    );

    router.notFoundHandler = _pageNotFound;
  }

  // Handlers
  static Handler _homeHanlder = Handler(
    handlerFunc: (context, params) {
      return HomeView();
    }
  );
  static Handler _characterHanlder = Handler(
    handlerFunc: (context, params) {
      print(params['id']?[0]);
      String idC = params['id']?[0] as String;
      return CharacterView(idC);
    }
  );
  static Handler _aboutHandler = Handler(
    handlerFunc: (context, params) => AboutView()
  );
  static Handler _pageNotFound = Handler(
    handlerFunc: (_,__) => View404()
  );
}