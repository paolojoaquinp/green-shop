// To parse this JSON data, do
//
//     final complaint = complaintFromJson(jsonString);

import 'dart:convert';

Complaint complaintFromJson(String str) => Complaint.fromJson(json.decode(str));

String complaintToJson(Complaint data) => json.encode(data.toJson());

class Complaint {
    String dependenciaOrganoActuante;
    DateTime fecha;
    bool denunciaPenal;
    bool intervencionSppd;
    String idInformant;
    String idVictim;
    String relatoDeHechos;

    Complaint({
        required this.dependenciaOrganoActuante,
        required this.fecha,
        required this.denunciaPenal,
        required this.intervencionSppd,
        required this.idInformant,
        required this.idVictim,
        required this.relatoDeHechos,
    });

    Complaint copyWith({
        String? dependenciaOrganoActuante,
        DateTime? fecha,
        bool? denunciaPenal,
        bool? intervencionSppd,
        String? idInformant,
        String? idVictim,
        String? relatoDeHechos,
    }) => 
        Complaint(
            dependenciaOrganoActuante: dependenciaOrganoActuante ?? this.dependenciaOrganoActuante,
            fecha: fecha ?? this.fecha,
            denunciaPenal: denunciaPenal ?? this.denunciaPenal,
            intervencionSppd: intervencionSppd ?? this.intervencionSppd,
            idInformant: idInformant ?? this.idInformant,
            idVictim: idVictim ?? this.idVictim,
            relatoDeHechos: relatoDeHechos ?? this.relatoDeHechos,
        );

    factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
        dependenciaOrganoActuante: json["dependencia_organo_actuante"],
        fecha: DateTime.parse(json["fecha"]),
        denunciaPenal: json["denuncia_penal"],
        intervencionSppd: json["intervencion_sppd"],
        idInformant: json["id_informant"],
        idVictim: json["id_victim"],
        relatoDeHechos: json["relato_de_hechos"],
    );

    Map<String, dynamic> toJson() => {
        "dependencia_organo_actuante": dependenciaOrganoActuante,
        "fecha": fecha.toIso8601String(),
        "denuncia_penal": denunciaPenal,
        "intervencion_sppd": intervencionSppd,
        "id_informant": idInformant,
        "id_victim": idVictim,
        "relato_de_hechos": relatoDeHechos,
    };
}
