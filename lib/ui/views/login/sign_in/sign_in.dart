/* import 'package:flutter/material.dart';
import 'package:green_shop/ui/constants/constants.dart';
import 'package:green_shop/ui/views/login/sign_in/sign_in_controller.dart';
import 'package:green_shop/ui/views/news/create/widgets/text_fields_form.dart';
import 'package:lottie/lottie.dart';


class SignInView extends StatefulWidget {

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  SignInController _controller = SignInController();
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Row(
        children: [
          _imageLayout(context),
          _formSignIn(context),
        ],
      ),
   );
  }

    Widget _actionsLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: primaryPurple),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: primaryPurple),
          ),
        ),
      ],
    );
  }


  Widget _buttonLogin(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: ElevatedButton(
          onPressed: _controller.login,
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: const Text('INGRESAR',style:TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _imageLayout(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      child: Lottie.asset('assets/logos/aniamtion_protege_app.json',
        width: size.width * 0.25,
        height: size.width * 0.25,
        fit: BoxFit.contain
      )
    );
  }

  Widget _formSignIn(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
      width: size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textFieldEmail(_controller),
          textFieldPassword(_controller),
          const SizedBox(height: 35,),
          _buttonLogin(context),
          _actionsLogin()
        ],
      ),
    );
  } 
} */