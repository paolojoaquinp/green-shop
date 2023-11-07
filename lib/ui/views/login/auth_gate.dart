import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_shop/locator.dart';
import 'package:green_shop/services/navigation_service.dart';
import 'package:green_shop/ui/views/home/home_view.dart';
import 'package:green_shop/ui/views/login/auth_gate_controller.dart';
import 'package:lottie/lottie.dart';


class AuthGate extends StatefulWidget {

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  AuthGateController _controller = AuthGateController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
       if (!snapshot.hasData) {
         return SignInScreen(
          resizeToAvoidBottomInset: true,
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) {
              final user = state.user;

              switch (user!.emailVerified) {
                case (true):
                  locator<NavigationService>().navigateTo('/home');
                  return;
                case (false):
                  locator<NavigationService>().navigateTo('/home');
                  /* Navigator.pushNamed(context, '/verify-email'); */
                  return;
              }
            }),
          ],
          styles: const {
              EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
          },
          sideBuilder: (context, constraints) {
             return Padding(
               padding: const EdgeInsets.all(20),
               child: AspectRatio(
                 aspectRatio: 1,
                 child: Lottie.asset('assets/logos/aniamtion_protege_app.json'),
               ),
             );
           },
           subtitleBuilder: (context, action) {
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0),
               child: action == AuthAction.signIn
                   ? const Text('Bienvenido a Protege App, Por Favor Inicia Sesion!')
                   : const Text('Bienvenido a Protege App, please registrate!'),
             );
           },
           footerBuilder: (context, action) {
             return const Padding(
               padding: EdgeInsets.only(top: 16),
               child: Text(
                 'By signing in, you agree to our terms and conditions.',
                 style: TextStyle(color: Colors.grey),
               ),
             );
           },
         );
       }
       return HomeView();
     },
    );
  }
}