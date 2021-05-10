import 'dart:convert';

class Doctor {
  Doctor({
    this.id,
    this.nom,
    this.prenom,
    this.cin,
    this.mail,
    this.telephone,
    this.hopital,
    this.service,
    this.v,
  });

  String id;
  String nom;
  String prenom;
  String cin;
  String mail;
  String telephone;
  String hopital;
  String service;
  int v;

  factory Doctor.fromRawJson(String str) => Doctor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["_id"],
        nom: json["nom"],
        prenom: json["prenom"],
        cin: json["cin"],
        mail: json["mail"],
        telephone: json["telephone"],
        hopital: json["hopital"],
        service: json["service"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nom": nom,
        "prenom": prenom,
        "cin": cin,
        "mail": mail,
        "telephone": telephone,
        "hopital": hopital,
        "service": service,
        "__v": v,
      };
}

class DoctorLoginArguments {
  DoctorLoginArguments({this.doctor, this.token});
  String token;
  Doctor doctor;
}
