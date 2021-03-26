import 'dart:convert';
import 'package:rhumatologie/models/bilan.dart';
import 'package:rhumatologie/models/jadas.dart';

class Patient {
  static List<Patient> patientFromJson(String str) =>
      List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

  Patient({
    this.id,
    this.nom,
    this.prenom,
    this.telephone,
    this.numDossier,
    this.diagnostic,
    this.ordonnance,
    this.jadas,
    this.v,
    this.bilan,
  });

  String id;
  String nom;
  String prenom;
  int telephone;
  int numDossier;
  String diagnostic;
  String ordonnance;
  List<Jadas> jadas;
  int v;
  List<Bilan> bilan;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["_id"],
        nom: json["nom"],
        prenom: json["prenom"],
        telephone: json["telephone"],
        numDossier: json["num_dossier"],
        diagnostic: json["diagnostic"],
        ordonnance: json["ordonnance"],
        jadas: List<Jadas>.from(json["JADAS"].map((x) => Jadas.fromJson(x))),
        v: json["__v"],
        bilan: List<Bilan>.from(json["Bilan"].map((x) => Bilan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nom": nom,
        "prenom": prenom,
        "telephone": telephone,
        "num_dossier": numDossier,
        "diagnostic": diagnostic,
        "ordonnance": ordonnance,
        "JADAS": List<dynamic>.from(jadas.map((x) => x.toJson())),
        "__v": v,
        "Bilan": List<dynamic>.from(bilan.map((x) => x.toJson())),
      };
}
