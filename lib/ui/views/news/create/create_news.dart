import 'package:flutter/material.dart';
import 'package:green_shop/ui/constants/constants.dart';
import 'package:green_shop/ui/views/news/create/widgets/text_fields_form.dart';
import 'package:green_shop/ui/views/news/create/create_news_controller.dart';
import 'package:lottie/lottie.dart';


class CreateNewsView extends StatefulWidget {

  @override
  State<CreateNewsView> createState() => _CreateNewsViewState();
}

class _CreateNewsViewState extends State<CreateNewsView> {
  final CreateNewsController _controller = CreateNewsController();
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
      width: size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Crear Noticia',style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
          const SizedBox(height: 40,),
          textFieldTitle(_controller),
          textFieldDescription(_controller),
          const SizedBox(height: 35,),
          _buttonSubmit(context),
        ],
      ),
    );
  }


  Widget _buttonSubmit(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: ElevatedButton(
          onPressed: _controller.addNews,
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: const Text('Crear Noticia',style:TextStyle(color: Colors.white)),
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


}