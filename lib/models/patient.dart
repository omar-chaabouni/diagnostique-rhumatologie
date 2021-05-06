import 'dart:convert';
import 'package:rhumatologie/models/bilan.dart';
import 'package:rhumatologie/models/chaq.dart';
import 'package:rhumatologie/models/jadas.dart';
import 'package:rhumatologie/models/jamar.dart';
import 'package:rhumatologie/models/jspada.dart';
// import 'package:rhumatologie/models/ordonnance.dart';

class Patient {
  static List<Patient> patientsFromJson(String str) =>
      List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));
  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  static String patientToJson(List<Patient> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  Patient({
    this.bilan,
    this.ordonnance,
    this.createdAt,
    this.id,
    this.nom,
    this.prenom,
    this.telephone,
    this.numDossier,
    this.diagnostic,
    this.jadas,
    this.v,
    this.jspada,
    this.chaq,
    this.jamar,
    this.dateNaissance,
    this.age,
    this.evaluation,
  });

  List<dynamic> ordonnance;
  DateTime createdAt;
  String id;
  String nom;
  String prenom;
  int telephone;
  int age;
  int numDossier;
  String diagnostic;
  List<Jadas> jadas;
  int v;
  List<dynamic> jspada;
  List<Chaq> chaq;
  List<dynamic> jamar;
  DateTime dateNaissance;
  int evaluation;
  List<Bilan> bilan;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        bilan: json["Bilan"] == null
            ? null
            : List<Bilan>.from(json["Bilan"].map((x) => Bilan.fromJson(x))),
        ordonnance: json["ordonnance"] == null ? null : json["ordonnance"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        id: json["_id"] == null ? null : json["_id"],
        nom: json["nom"] == null ? null : json["nom"],
        prenom: json["prenom"] == null ? null : json["prenom"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        numDossier: json["num_dossier"] == null ? null : json["num_dossier"],
        diagnostic: json["diagnostic"] == null ? null : json["diagnostic"],
        jadas: json["JADAS"] == null
            ? null
            : List<Jadas>.from(json["JADAS"].map((x) => Jadas.fromJson(x))),
        v: json["__v"] == null ? null : json["__v"],
        jspada: json["JSPADA"] == null
            ? null
            : List<Jspada>.from(json["JSPADA"].map((x) => x)),
        chaq: json["CHAQ"] == null
            ? null
            : List<Chaq>.from(json["CHAQ"].map((x) => Chaq.fromJson(x))),
        jamar: json["JAMAR"] == null
            ? null
            : List<Jamar>.from(json["JAMAR"].map((x) => x)),
        dateNaissance: json["date_naissance"] == null
            ? null
            : DateTime.parse(json["date_naissance"]),
        age: json["age"] == null ? null : json["age"],
        evaluation: json["evaluation"] == null ? null : json["evaluation"],
      );

  Map<String, dynamic> toJson() => {
        "Bilan": bilan[0].toJson(),
        "ordonnance": ordonnance,
        "createdAt": createdAt.toIso8601String(),
        "_id": id,
        "nom": nom,
        "prenom": prenom,
        "telephone": telephone,
        "num_dossier": numDossier,
        "diagnostic": diagnostic,
        "JADAS": List<dynamic>.from(jadas.map((x) => x.toJson())),
        "__v": v,
        "JSPADA": List<dynamic>.from(jspada.map((x) => x)),
        "CHAQ": List<dynamic>.from(chaq.map((x) => x.toJson())),
        "JAMAR": List<dynamic>.from(jamar.map((x) => x)),
        "date_naissance":
            dateNaissance == null ? null : dateNaissance.toIso8601String(),
        "age": age,
        "evaluation": evaluation == null ? null : evaluation,
      };
}
