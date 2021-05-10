import 'dart:convert';
import 'package:rhumatologie/models/bilan.dart';
import 'package:rhumatologie/models/chaq.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/jadas.dart';
import 'package:rhumatologie/models/jamar.dart';
import 'package:rhumatologie/models/jspada.dart';

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
    this.docteur,
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
  int v;
  List<Jadas> jadas;
  List<Jspada> jspada;
  List<Chaq> chaq;
  List<Jamar> jamar;
  DateTime dateNaissance;
  int evaluation;
  List<Bilan> bilan;
  Doctor docteur;

  factory Patient.fromJson(Map<String, dynamic> jsonn) => Patient(
        docteur: jsonn["docteur"] == null
            ? null
            : Doctor.fromRawJson(json.encode(jsonn["docteur"])),
        bilan: jsonn["Bilan"] == null
            ? null
            : List<Bilan>.from(jsonn["Bilan"].map((x) => Bilan.fromJson(x))),
        ordonnance: jsonn["ordonnance"] == null ? null : jsonn["ordonnance"],
        createdAt: jsonn["createdAt"] == null
            ? null
            : DateTime.parse(jsonn["createdAt"]),
        id: jsonn["_id"] == null ? null : jsonn["_id"],
        nom: jsonn["nom"] == null ? null : jsonn["nom"],
        prenom: jsonn["prenom"] == null ? null : jsonn["prenom"],
        telephone: jsonn["telephone"] == null ? null : jsonn["telephone"],
        numDossier: jsonn["num_dossier"] == null ? null : jsonn["num_dossier"],
        diagnostic: jsonn["diagnostic"] == null ? null : jsonn["diagnostic"],
        v: jsonn["__v"] == null ? null : jsonn["__v"],
        jadas: jsonn["JADAS"] == null
            ? null
            : List<Jadas>.from(jsonn["JADAS"].map((x) => Jadas.fromJson(x))),
        jspada: jsonn["JSPADA"] == null
            ? null
            : List<Jspada>.from(jsonn["JSPADA"].map((x) => Jspada.fromJson(x))),
        chaq: jsonn["CHAQ"] == null
            ? null
            : List<Chaq>.from(jsonn["CHAQ"].map((x) => Chaq.fromJson(x))),
        jamar: jsonn["JAMAR"] == null
            ? null
            : List<Jamar>.from(jsonn["JAMAR"].map((x) => x)),
        dateNaissance: jsonn["date_naissance"] == null
            ? null
            : DateTime.parse(jsonn["date_naissance"]),
        age: jsonn["age"] == null ? null : jsonn["age"],
        evaluation: jsonn["evaluation"] == null ? null : jsonn["evaluation"],
      );

  Map<String, dynamic> toJson() => {
        "Bilan": bilan != null ? bilan[0].toJson() : [],
        "ordonnance": ordonnance != null ? ordonnance : [],
        "createdAt": createdAt != null
            ? createdAt.toIso8601String()
            : DateTime.now().toIso8601String(),
        "_id": id,
        "nom": nom != null ? nom : '',
        "prenom": prenom != null ? prenom : '',
        "telephone": telephone,
        "num_dossier": numDossier,
        "diagnostic": diagnostic,
        "JADAS":
            jadas == null ? [] : List<Jadas>.from(jadas.map((x) => x.toJson())),
        "JSPADA": jspada == null ? [] : List<Jspada>.from(jspada.map((x) => x)),
        "CHAQ":
            chaq == null ? [] : List<Chaq>.from(chaq.map((x) => x.toJson())),
        "JAMAR": jamar == null ? [] : List<Jamar>.from(jamar.map((x) => x)),
        "date_naissance":
            dateNaissance == null ? null : dateNaissance.toIso8601String(),
        "age": age == null ? 0 : age,
        "__v": v == null ? 0 : v,
        "evaluation": evaluation == null ? null : evaluation,
        "docteur": docteur != null ? docteur.toJson() : null,
      };
}
