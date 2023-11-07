// To parse this JSON data, do
//
//     final informant = informantFromJson(jsonString);

import 'dart:convert';

Informant informantFromJson(String str) => Informant.fromJson(json.decode(str));

String informantToJson(Informant data) => json.encode(data.toJson());

class Informant {
    String nombre;
    String apellido;
    String nroDocumento;
    String nacionalidad;
    DateTime fechaNacimiento;
    String vinculoConVictima;
    String representacionInstitucion;
    String direccion;
    List<String> telefonos;
    bool pideReservaIdentidad;

    Informant({
        required this.nombre,
        required this.apellido,
        required this.nroDocumento,
        required this.nacionalidad,
        required this.fechaNacimiento,
        required this.vinculoConVictima,
        required this.representacionInstitucion,
        required this.direccion,
        required this.telefonos,
        required this.pideReservaIdentidad,
    });

    Informant copyWith({
        String? nombre,
        String? apellido,
        String? nroDocumento,
        String? nacionalidad,
        DateTime? fechaNacimiento,
        String? vinculoConVictima,
        String? representacionInstitucion,
        String? direccion,
        List<String>? telefonos,
        bool? pideReservaIdentidad,
    }) => 
        Informant(
            nombre: nombre ?? this.nombre,
            apellido: apellido ?? this.apellido,
            nroDocumento: nroDocumento ?? this.nroDocumento,
            nacionalidad: nacionalidad ?? this.nacionalidad,
            fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
            vinculoConVictima: vinculoConVictima ?? this.vinculoConVictima,
            representacionInstitucion: representacionInstitucion ?? this.representacionInstitucion,
            direccion: direccion ?? this.direccion,
            telefonos: telefonos ?? this.telefonos,
            pideReservaIdentidad: pideReservaIdentidad ?? this.pideReservaIdentidad,
        );

    factory Informant.fromJson(Map<String, dynamic> json) => Informant(
        nombre: json["nombre"],
        apellido: json["apellido"],
        nroDocumento: json["nro_documento"],
        nacionalidad: json["nacionalidad"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        vinculoConVictima: json["vinculo_con_victima"],
        representacionInstitucion: json["representacion_institucion"],
        direccion: json["direccion"],
        telefonos: List<String>.from(json["telefonos"].map((x) => x)),
        pideReservaIdentidad: json["pide_reserva_identidad"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "nro_documento": nroDocumento,
        "nacionalidad": nacionalidad,
        "fecha_nacimiento": fechaNacimiento.toIso8601String(),
        "vinculo_con_victima": vinculoConVictima,
        "representacion_institucion": representacionInstitucion,
        "direccion": direccion,
        "telefonos": List<String>.from(telefonos.map((x) => x)),
        "pide_reserva_identidad": pideReservaIdentidad,
    };
}
