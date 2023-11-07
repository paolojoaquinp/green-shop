
import 'package:fluro/fluro.dart';
import 'package:green_shop/ui/views/about_view.dart';
import 'package:green_shop/ui/views/login/auth_gate.dart';

import 'package:green_shop/ui/views/complaint/complaint_view.dart';
import 'package:green_shop/ui/views/home/home_view.dart';
import 'package:green_shop/ui/views/login/sign_in/sign_in.dart';
import 'package:green_shop/ui/views/login/sign_up/sign_up.dart';
import 'package:green_shop/ui/views/news/create/create_news.dart';

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
      '/login',
      handler: _loginHandler,
      transitionType: TransitionType.fadeIn
    );
/*     router.define(
      '/sign-in',
      handler: _signInHandler,
      transitionType: TransitionType.fadeIn
    ); */
    router.define(
      '/sign-up',
      handler: _signUpHandler,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/home',
      handler: _homeHanlder,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/complaint',
      handler: _complaintHandler,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/about',
      handler: _aboutHandler,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/create-news',
      handler: _createNewsHandler,
      transitionType: TransitionType.fadeIn
    );
    router.define(
      '/edit-news',
      handler: _editNewsHandler,
      transitionType: TransitionType.fadeIn
    );

    router.notFoundHandler = _pageNotFound;
  }

  static final Handler _createNewsHandler = Handler(
    handlerFunc: (context, params) {
      return CreateNewsView();
    }
  );
  static final Handler _editNewsHandler = Handler(
    handlerFunc: (context,params) {
      return CreateNewsView();
    }
  );
  // Handlers
  static final Handler _loginHandler = Handler(
    handlerFunc: (context, params) {
      return AuthGate();
    }
  );
/*   static final Handler _signInHandler = Handler(
    handlerFunc: (context, params) {
      return SignInView();
    }
  ); */
  static final Handler _signUpHandler = Handler(
    handlerFunc: (context, params) {
      return SignUpView();
    }
  );
  static final Handler _homeHanlder = Handler(
    handlerFunc: (context, params) {
      return HomeView();
    }
  );

  static final Handler _complaintHandler= Handler(
    handlerFunc: (context, params) => ComplaintView()
  );
  static final Handler _aboutHandler = Handler(
    handlerFunc: (context, params) => AboutView()
  );
  static final Handler _pageNotFound = Handler(
    handlerFunc: (_,__) => View404()
  );
}