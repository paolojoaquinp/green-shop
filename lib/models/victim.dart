// To parse this JSON data, do
//
//     final victim = victimFromJson(jsonString);

import 'dart:convert';

/*   "nombre": "asd",
  "apellido": "sad",
  "apodo": "asdsa",
  "lugar_nacimiento": "sadas",
  "fecha_nacimiento": "2012-04-23T18:25:43.511Z",
  "nacionalidad": "asd",
  "nro_documento": "9123",
  "exhibe": "SI",
  "genero":"asd",
  "ocupacion": "SI",
  "trabajo_informal": "SI",
  "ama_de_casa": false,
  "ingresos_propios": false,
  "nivel_educativo": "asdas",
  "cobertura_salud": "prepaga",
  "beneficio_plan_social":true,
  "direccion": "ads",
  "telefono_particular": "asd",
  "telefono_celular": "asdas",
  "horario_disponibilidad": "asd",
  "telefono_referencia": "asdlk",
  "detalle_denunciado": {
      "denunciado": "esposo",
      "convive_actualemente": false,
      "vivienda": "propia",
      "comparte_vivienda": false
  } */
Victim victimFromJson(String str) => Victim.fromJson(json.decode(str));

String victimToJson(Victim data) => json.encode(data.toJson());

class Victim {
    String nombre;
    String apellido;
    String apodo;
    String lugarNacimiento;
    DateTime fechaNacimiento;
    String nacionalidad;
    String nroDocumento;
    String exhibe;
    String genero;
    String ocupacion;
    String trabajoInformal;
    bool amaDeCasa;
    bool ingresosPropios;
    String nivelEducativo;
    String coberturaSalud;
    bool beneficioPlanSocial;
    String direccion;
    String telefonoParticular;
    String telefonoCelular;
    String horarioDisponibilidad;
    String telefonoReferencia;
    DetalleDenunciado detalleDenunciado;

    Victim({
        required this.nombre,
        required this.apellido,
        required this.apodo,
        required this.lugarNacimiento,
        required this.fechaNacimiento,
        required this.nacionalidad,
        required this.nroDocumento,
        required this.exhibe,
        required this.genero,
        required this.ocupacion,
        required this.trabajoInformal,
        required this.amaDeCasa,
        required this.ingresosPropios,
        required this.nivelEducativo,
        required this.coberturaSalud,
        required this.beneficioPlanSocial,
        required this.direccion,
        required this.telefonoParticular,
        required this.telefonoCelular,
        required this.horarioDisponibilidad,
        required this.telefonoReferencia,
        required this.detalleDenunciado,
    });

    Victim copyWith({
        String? nombre,
        String? apellido,
        String? apodo,
        String? lugarNacimiento,
        DateTime? fechaNacimiento,
        String? nacionalidad,
        String? nroDocumento,
        String? exhibe,
        String? genero,
        String? ocupacion,
        String? trabajoInformal,
        bool? amaDeCasa,
        bool? ingresosPropios,
        String? nivelEducativo,
        String? coberturaSalud,
        bool? beneficioPlanSocial,
        String? direccion,
        String? telefonoParticular,
        String? telefonoCelular,
        String? horarioDisponibilidad,
        String? telefonoReferencia,
        DetalleDenunciado? detalleDenunciado,
    }) => 
        Victim(
            nombre: nombre ?? this.nombre,
            apellido: apellido ?? this.apellido,
            apodo: apodo ?? this.apodo,
            lugarNacimiento: lugarNacimiento ?? this.lugarNacimiento,
            fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
            nacionalidad: nacionalidad ?? this.nacionalidad,
            nroDocumento: nroDocumento ?? this.nroDocumento,
            exhibe: exhibe ?? this.exhibe,
            genero: genero ?? this.genero,
            ocupacion: ocupacion ?? this.ocupacion,
            trabajoInformal: trabajoInformal ?? this.trabajoInformal,
            amaDeCasa: amaDeCasa ?? this.amaDeCasa,
            ingresosPropios: ingresosPropios ?? this.ingresosPropios,
            nivelEducativo: nivelEducativo ?? this.nivelEducativo,
            coberturaSalud: coberturaSalud ?? this.coberturaSalud,
            beneficioPlanSocial: beneficioPlanSocial ?? this.beneficioPlanSocial,
            direccion: direccion ?? this.direccion,
            telefonoParticular: telefonoParticular ?? this.telefonoParticular,
            telefonoCelular: telefonoCelular ?? this.telefonoCelular,
            horarioDisponibilidad: horarioDisponibilidad ?? this.horarioDisponibilidad,
            telefonoReferencia: telefonoReferencia ?? this.telefonoReferencia,
            detalleDenunciado: detalleDenunciado ?? this.detalleDenunciado,
        );

    factory Victim.fromJson(Map<String, dynamic> json) => Victim(
        nombre: json["nombre"],
        apellido: json["apellido"],
        apodo: json["apodo"],
        lugarNacimiento: json["lugar_nacimiento"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        nacionalidad: json["nacionalidad"],
        nroDocumento: json["nro_documento"],
        exhibe: json["exhibe"],
        genero: json["genero"],
        ocupacion: json["ocupacion"],
        trabajoInformal: json["trabajo_informal"],
        amaDeCasa: json["ama_de_casa"],
        ingresosPropios: json["ingresos_propios"],
        nivelEducativo: json["nivel_educativo"],
        coberturaSalud: json["cobertura_salud"],
        beneficioPlanSocial: json["beneficio_plan_social"],
        direccion: json["direccion"],
        telefonoParticular: json["telefono_particular"],
        telefonoCelular: json["telefono_celular"],
        horarioDisponibilidad: json["horario_disponibilidad"],
        telefonoReferencia: json["telefono_referencia"],
        detalleDenunciado: DetalleDenunciado.fromJson(json["detalle_denunciado"]),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "apodo": apodo,
        "lugar_nacimiento": lugarNacimiento,
        "fecha_nacimiento": fechaNacimiento.toIso8601String(),
        "nacionalidad": nacionalidad,
        "nro_documento": nroDocumento,
        "exhibe": exhibe,
        "genero": genero,
        "ocupacion": ocupacion,
        "trabajo_informal": trabajoInformal,
        "ama_de_casa": amaDeCasa,
        "ingresos_propios": ingresosPropios,
        "nivel_educativo": nivelEducativo,
        "cobertura_salud": coberturaSalud,
        "beneficio_plan_social": beneficioPlanSocial,
        "direccion": direccion,
        "telefono_particular": telefonoParticular,
        "telefono_celular": telefonoCelular,
        "horario_disponibilidad": horarioDisponibilidad,
        "telefono_referencia": telefonoReferencia,
        "detalle_denunciado": detalleDenunciado.toJson(),
    };
}

class DetalleDenunciado {
    String denunciado;
    bool conviveActualemente;
    String vivienda;
    bool comparteVivienda;

    DetalleDenunciado({
        required this.denunciado,
        required this.conviveActualemente,
        required this.vivienda,
        required this.comparteVivienda,
    });

    DetalleDenunciado copyWith({
        String? denunciado,
        bool? conviveActualemente,
        String? vivienda,
        bool? comparteVivienda,
    }) => 
        DetalleDenunciado(
            denunciado: denunciado ?? this.denunciado,
            conviveActualemente: conviveActualemente ?? this.conviveActualemente,
            vivienda: vivienda ?? this.vivienda,
            comparteVivienda: comparteVivienda ?? this.comparteVivienda,
        );

    factory DetalleDenunciado.fromJson(Map<String, dynamic> json) => DetalleDenunciado(
        denunciado: json["denunciado"],
        conviveActualemente: json["convive_actualemente"],
        vivienda: json["vivienda"],
        comparteVivienda: json["comparte_vivienda"],
    );

    Map<String, dynamic> toJson() => {
        "denunciado": denunciado,
        "convive_actualemente": conviveActualemente,
        "vivienda": vivienda,
        "comparte_vivienda": comparteVivienda,
    };
}
