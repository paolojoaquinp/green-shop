import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_shop/providers/complaint_provider.dart';

class ComplaintView extends StatefulWidget {
  @override
  _ComplaintViewState createState() => _ComplaintViewState();
}

class _ComplaintViewState extends State<ComplaintView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController shortDescController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController agresionesController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  final providerComp = ComplaintProvider();
  
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  void register() {
    String shortDesc = shortDescController.text.trim();
    String descripcion = descriptionController.text.trim();
   /*  String agreciones = agresionesController.text.trim(); */
   
    final user = FirebaseAuth.instance;
    providerComp.addComplaint(user.currentUser!.uid, selectedDate, descripcion, shortDesc);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.23, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  /* BackButton(), */
                  SizedBox(
                    child: Text('Registrar Denuncia',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Denunciante',
                            style: TextStyle(fontSize: 32.0),
                          ),
                          Row(
                            children: [
                              _shortDescField(),
                              const Spacer(),
                              _descriptionField(),
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Apellido', descriptionHint: 'Ingresa un apellido'),
                              const Spacer(),
                              _inputString(label: 'Nombre', descriptionHint: 'Ingresa un Nombre')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Documento De Identidad', descriptionHint: 'Ingresa un número'),
                              const Spacer(),
                              _inputString(label: 'Exhibe', descriptionHint: 'Ej: Si, No, No Tiene')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Vinculo con la victima', descriptionHint: 'Establece si es que se tiene un vinculo con la victima'),
                              const Spacer(),
                              _inputString(label: 'Representa A una Institución', descriptionHint: 'Ej: Si, No')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Domicilio', descriptionHint: 'Avenida, ej: #123, Calle #12 '),
                              const Spacer(),
                              _inputString(label: 'Telefonos', descriptionHint: 'Ej: 91239123')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Pide Reserva de Identidad', descriptionHint: 'Ej: Si, No'),
                              const Spacer(),
                            ],
                          ),
                        ],
                      )
                    ),
                    const SizedBox(height: 50,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Victima',
                            style: TextStyle(fontSize: 32.0),
                          ),
                          Row(
                            children: [
                              _shortDescField(),
                              const Spacer(),
                              _descriptionField(),
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Apellido', descriptionHint: 'Ingresa un apellido'),
                              const Spacer(),
                              _inputString(label: 'Nombre', descriptionHint: 'Ingresa un Nombre')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Apodo', descriptionHint: 'Ingresa un apodo'),
                              const Spacer(),
                              _inputString(label: 'Lugar y Fecha de Nac', descriptionHint: 'Ej: La Paz - 20-ene-2000')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Nacionalidad', descriptionHint: 'Ej: Boliviana, Paraguaya'),
                              const Spacer(),
                              _inputString(label: 'Estado Civil', descriptionHint: 'Ej: Soltero(a)')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Documento de Identidad', descriptionHint: 'Ej: 1234324'),
                              const Spacer(),
                              _inputString(label: 'Exhibe', descriptionHint: 'Ej: Si, No, No tiene')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Sexo/Genero', descriptionHint: 'Ej: F, M'),
                              const Spacer(),
                              _inputString(label: 'Ocupacion', descriptionHint: 'Ej: Si, No, No tiene')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Trabajo Informal', descriptionHint: 'Ej: Si, No, Cual'),
                              const Spacer(),
                              _inputString(label: 'Ocupacion', descriptionHint: 'Ej: Si, No, No tiene')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Ama de casa', descriptionHint: 'Ej: Si, No'),
                              const Spacer(),
                              _inputString(label: 'Ingresos propios?', descriptionHint: 'Ej: Si, No')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Nivel educativo', descriptionHint: 'Ej: Bachillerato, Universitario Superior, etc.'),
                              const Spacer(),
                              _inputString(label: 'Analfabeto(a)', descriptionHint: 'Ej: Si, No')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Cobertura de Salud', descriptionHint: 'Obra Social/ Mutual     b) Prepaga   c) Sistema Público Es adherente o titular? '),
                              const Spacer(),
                              _inputString(label: 'BENEFICIO O PLAN SOCIAL', descriptionHint: 'Ej: Si, No')
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'DOMICILIO HABITUAL', descriptionHint: '   Calle: n° Piso/Depto. Barrio Localidad Partido'),
                              const Spacer(),
                              _inputString(label: 'DOMICILIO TRANSITORIO DE RESGUARDO', descriptionHint: '   Calle: n° Piso/Depto. Barrio Localidad Partido'),
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Telefono Celular', descriptionHint: 'Ej: 09123091'),
                              const Spacer(),
                              _inputString(label: 'HORARIO EN QUE PUEDE SER CONTACTADA/O:', descriptionHint: 'Ej: 21:00 a 22:00'),
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'EL DENUNCIADO ES SU: ', descriptionHint: 'Ej: Esposo, Ex Pareja, Hijo(a), etc.'),
                              const Spacer(),
                              _inputString(label: 'CONVIVE ACTUALMENTE CON EL AGRESOR?', descriptionHint: 'Ej: Si, No'),
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'VIVIENDA: ', descriptionHint: 'Ej: Propia, del agresor'),
                              const Spacer(),
                              _inputString(label: '¿COMPARTE ESA VIVIENDA CON OTRO GRUPO FAMILIAR?  ', descriptionHint: 'Ej: Si, No'),
                            ],
                          ),
                          Row(
                            children: [
                              _inputString(label: 'Pide Reserva de Identidad', descriptionHint: 'Ej: Si, No'),
                              const Spacer(),
                            ],
                          ),
                        ],
                      )
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 32.0,
                      child: ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            register();
                            _formKey.currentState!.save();
                          }
                        },
                        child: Text('Guardar'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _inputString({required String label, TextEditingController? controller, required String descriptionHint}) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.0),
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: descriptionHint),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingresa un titulo corto';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _shortDescField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: TextFormField(
        controller: shortDescController,
        decoration: InputDecoration(labelText: 'Descripcion corta'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingresa un titulo corto';
          }
          return null;
        },
      ),
    );
  }

  Widget _descriptionField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: TextFormField(
        controller: descriptionController,
        decoration: InputDecoration(labelText: 'Descripción'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingresa una descripción';
          }
          return null;
        },
      ),
    );
  }
}