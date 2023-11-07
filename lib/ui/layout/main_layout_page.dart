import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_shop/ui/shared/custom_app_menu.dart';
import 'package:green_shop/utils.dart' as utils;

import '../constants/constants.dart';

class MainLayoutPage extends StatelessWidget {
  final Widget child;

  const MainLayoutPage({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (_) =>
          Scaffold(
            body: Center(
              child:Column(
                children: [
                  CustomAppMenu(),
                  Expanded(
                    child: child,
                  )
                ],
              )
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                utils.openInWindow('https://chat-app-paolo.vercel.app/auth/register', 'new tab');
              },
              tooltip: 'Ir a Ayuda Por Chat',
              backgroundColor: primaryPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/chatbot-icon.svg',colorFilter: ColorFilter.mode(Colors.white,BlendMode.srcIn),fit: BoxFit.cover,),
              ),
            ),
          ),
        )
      ],
    );
  }
}
