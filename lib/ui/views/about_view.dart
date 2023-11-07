import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1,vertical: 32),
        child: Column(
          children: [
            const Text('Acerca de Protege App',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 42,
              )
            ),
            SizedBox(height: size.height * 0.05),
            const Text('Protege App es una aplicación dedicada a prevenir la violencia contra las mujeres. Nuestra misión es brindar un espacio seguro para que las mujeres puedan registrar denuncias de violencia y abuso, con el objetivo de proporcionar ayuda y apoyo adecuados en tiempo real. \n',
              style: TextStyle(
                fontSize: 26,
              )
            ),
            const Text('Nuestra aplicación facilita el proceso de denuncia y el acceso a recursos esenciales, como contactos de organizaciones de ayuda, líneas de emergencia y servicios de asesoramiento. Estamos comprometidos en empoderar a las mujeres y en trabajar juntas para eliminar la violencia de género.',
              style: TextStyle(
                fontSize: 24,
              )
            ),
            SizedBox(height: size.height * 0.1),
            const Text('\u00a9 2023 Protege App',
              style: TextStyle(
                fontSize: 26,
              )
            ),
          ],
        ),
    );
  }
}