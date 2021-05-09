import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/chaq.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/historique_arguments.dart';
import 'package:rhumatologie/models/jadas.dart';
import 'package:rhumatologie/models/jamar.dart';
import 'package:rhumatologie/models/jspada.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/historique_score.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/screens/pages%20docteur/valider_bilans.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class EditUserPrescription extends StatefulWidget {
  Patient patient;
  Doctor doctor;
  String token;
  EditUserPrescription({this.doctor, this.token, this.patient});
  @override
  _EditUserPrescriptionState createState() => _EditUserPrescriptionState();
}

class _EditUserPrescriptionState extends State<EditUserPrescription> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();
  var controller5 = TextEditingController();
  ScrollController scrollController = ScrollController();

  double evaluationGlobaleFaiteParMedecin = 0;
  int nbrCards = 0;
  bool existeBilanNonValide = false;
  bool hemoglobine = false;
  bool vgm = false;
  bool tcmh = false;
  bool globulesBlancs = false;
  bool polynucleairesNeutrophiles = false;
  bool lymphocyte = false;
  bool plaquettes = false;
  bool vitesseDeSedimentation = false;
  bool proteineCReactive = false;
  bool asat = false;
  bool alat = false;
  bool ggt = false;
  bool pal = false;
  bool creatinine = false;
  bool ferritinemie = false;
  bool ecbu = false;
  bool serologieHepatiteC = false;
  bool serologieHepatiteB = false;
  bool jamarDemanded = true;
  bool jamarDemandedNotRempli = true;

  List<String> scoreNames = ['JADAS', 'JSPADA', 'CHAQ', 'JAMAR'];
  List<String> scoreResults = <String>['  --  ', '  --  ', '  --  ', '  --  '];
  List<bool> testDemanded = [false, false, false, false];
  List<bool> testRempli = [false, false, false, false]; // if true test rempli
  List<bool> testValidated = [false, false, false, false]; //if true test validé

  void initState() {
    super.initState();
    fillScoreResults(widget.patient);
    fillTestRempli(widget.patient);
    fillTestValidated(widget.patient);
    filltestDemanded(widget.patient);
    fillOrdonnanceInitiale();
  }

  void fillOrdonnanceInitiale() {
    if (widget.patient.ordonnance.isNotEmpty) {
      for (int i = 0; i < 5; i++) {
        if (widget.patient.ordonnance.asMap()[i] == null) {
          widget.patient.ordonnance.add('');
        }
      }
      if (widget.patient.ordonnance[0] != '') {
        controller1.text = widget.patient.ordonnance[0];
      }
      if (widget.patient.ordonnance[1] != '') {
        controller2.text = widget.patient.ordonnance[1];
      }
      if (widget.patient.ordonnance[2] != '') {
        controller3.text = widget.patient.ordonnance[2];
      }
      if (widget.patient.ordonnance[3] != '') {
        controller4.text = widget.patient.ordonnance[3];
      }
      if (widget.patient.ordonnance[4] != '') {
        controller5.text = widget.patient.ordonnance[4];
      }
    } else {
      for (int i = 0; i < 5; i++) {
        if (widget.patient.ordonnance.asMap()[i] == null) {
          widget.patient.ordonnance.add('');
        }
      }
    }
    if (widget.patient.bilan.isNotEmpty) {
      if (widget.patient.bilan[0].typeBilan.isNotEmpty) {
        if (widget.patient.bilan[0].state == 0) {
          existeBilanNonValide = true;
        }
      }
    }
    evaluationGlobaleFaiteParMedecin = widget.patient.evaluation.toDouble();
  }

  void fillScoreResults(Patient patient) {
    if (patient.jadas != null) {
      if (patient.jadas.isNotEmpty) {
        if (patient.jadas[0].dateCalcul != null) {
          scoreResults[0] = patient.jadas[0].score;
        }
      }
    }
    if (patient.jspada != null) {
      if (patient.jspada.isNotEmpty) {
        if (patient.jspada[0].dateCalcul != null) {
          scoreResults[1] = patient.jspada[0].score;
        }
      }
    }
    if (patient.chaq != null) {
      if (patient.chaq.isNotEmpty) {
        if (patient.chaq[0].dateCalcul != null) {
          scoreResults[2] = patient.chaq[0].score;
        }
      }
    }
    if (patient.jamar != null) {
      if (patient.jamar.isNotEmpty) {
        if (patient.jamar[0].dateCalcul != null) {
          scoreResults[3] = patient.jamar[0].score;
        }
      }
    }
  }

  void fillTestRempli(Patient patient) {
    if (patient.jadas != null) {
      if (patient.jadas.isNotEmpty) {
        if (patient.jadas[0].dateCalcul != null) {
          testRempli[0] = true;
        }
      }
    }
    if (patient.jspada != null) {
      if (patient.jspada.isNotEmpty) {
        if (patient.jspada[0].dateCalcul != null) {
          testRempli[1] = true;
        }
      }
    }
    if (patient.chaq != null) {
      if (patient.chaq.isNotEmpty) {
        if (patient.chaq[0].dateCalcul != null) {
          testRempli[2] = true;
        }
      }
    }
    if (patient.jamar != null) {
      if (patient.jamar.isNotEmpty) {
        if (patient.jamar[0].dateCalcul != null) {
          testRempli[3] = true;
        }
      }
    }
  }

  void fillTestValidated(Patient patient) {
    if (patient.jadas != null) {
      if (patient.jadas.isNotEmpty) {
        if (patient.jadas[0].dateValidation != null) {
          testValidated[0] = true;
        }
      }
    }
    if (patient.jspada != null) {
      if (patient.jspada.isNotEmpty) {
        if (patient.jspada[0].dateValidation != null) {
          testValidated[1] = true;
        }
      }
    }
    if (patient.chaq != null) {
      if (patient.chaq.isNotEmpty) {
        if (patient.chaq[0].dateValidation != null) {
          testValidated[2] = true;
        }
      }
    }
    if (patient.jamar != null) {
      if (patient.jamar.isNotEmpty) {
        if (patient.jamar[0].dateValidation != null) {
          testValidated[3] = true;
        }
      }
    }
  }

  void filltestDemanded(Patient patient) {
    if (patient.jadas != null) {
      if (patient.jadas.isNotEmpty) {
        if (patient.jadas[0].dateDemande != null) {
          testDemanded[0] = true;
        }
      }
    }
    if (patient.jspada != null) {
      if (patient.jspada.isNotEmpty) {
        if (patient.jspada[0].dateDemande != null) {
          testDemanded[1] = true;
        }
      }
    }
    if (patient.chaq != null) {
      if (patient.chaq.isNotEmpty) {
        if (patient.chaq[0].dateDemande != null) {
          testDemanded[2] = true;
        }
      }
    }
    if (patient.jamar != null) {
      if (patient.jamar.isNotEmpty) {
        if (patient.jamar[0].dateDemande != null) {
          testDemanded[3] = true;
        }
      }
    }
  }

  demanderTest(String typeScore) async {
    String demanderTestURL =
        'http://192.168.1.16:4000/doctors/${widget.doctor.id}/patients/${widget.patient.id}/';
    if (typeScore == "JADAS") {
      demanderTestURL = demanderTestURL + "newJADAS";
    } else if (typeScore == "JSPADA") {
      demanderTestURL = demanderTestURL + "newJSPADA";
    } else if (typeScore == "CHAQ") {
      demanderTestURL = demanderTestURL + "newCHAQ";
    } else {
      demanderTestURL = demanderTestURL + "newJamar";
    }
    try {
      var demanderTestResponse = await http.post("$demanderTestURL", headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}'
      });
      Future.delayed(Duration(milliseconds: 1000), () {
        if (demanderTestResponse.statusCode == 200 ||
            demanderTestResponse.statusCode == 201 ||
            demanderTestResponse.statusCode == 202 ||
            demanderTestResponse.statusCode == 203) {
          enregistrerAvecSuccess(context);
        } else {
          Future.delayed(Duration(milliseconds: 1000), () {
            erreurEnregistrement(context);
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  validerTest(String typeScore) async {
    String validerTestURL =
        'http://192.168.1.16:4000/doctors/${widget.doctor.id}/patients/${widget.patient.id}/';
    if (typeScore == "JADAS") {
      validerTestURL = validerTestURL + "validJADAS";
    } else if (typeScore == "JSPADA") {
      validerTestURL = validerTestURL + "validJSPADA";
    } else if (typeScore == "CHAQ") {
      validerTestURL = validerTestURL + "validCHAQ";
    } else {
      validerTestURL = validerTestURL + "validJamar";
    }
    try {
      var validerTestResponse = await http.post("$validerTestURL", headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}'
      });
      Future.delayed(Duration(milliseconds: 1000), () {
        if (validerTestResponse.statusCode == 200 ||
            validerTestResponse.statusCode == 201 ||
            validerTestResponse.statusCode == 202 ||
            validerTestResponse.statusCode == 203) {
          enregistrerAvecSuccess(context);
        } else {
          Future.delayed(Duration(milliseconds: 1000), () {
            erreurEnregistrement(context);
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void saveOrdonnanceAndEvaluationAndBilan(String patientIdString) async {
    List<String> nouvelleOrdonnance = [];
    nouvelleOrdonnance.addAll([
      controller1.text,
      controller2.text,
      controller3.text,
      controller4.text,
      controller5.text
    ]);
    bool success1 = true;
    bool success2 = true;
    bool success3 = true;
    String updateEvaluationURL =
        'http://192.168.1.16:4000/doctors/${widget.doctor.id.toString()}/patients/$patientIdString/updateEvaluation';
    if (evaluationGlobaleFaiteParMedecin.toInt() != widget.patient.evaluation) {
      try {
        var updateEvaluationResponse = await http.post("$updateEvaluationURL",
            body: json.encode(
                {"evaluation": evaluationGlobaleFaiteParMedecin.toInt()}),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${widget.token}'
            });
        if (updateEvaluationResponse.statusCode == 200 ||
            updateEvaluationResponse.statusCode == 201 ||
            updateEvaluationResponse.statusCode == 202 ||
            updateEvaluationResponse.statusCode == 203) {
          success1 = true;
        } else {
          success1 = false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
    String updateOrdonnanceURL =
        'http://192.168.1.16:4000/doctors/${widget.doctor.id.toString()}/patients/$patientIdString/updateOrdonnance';
    try {
      var updateOrdonnanceResponse = await http.post("$updateOrdonnanceURL",
          body: json.encode({"ordonnance": nouvelleOrdonnance}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${widget.token}'
          });
      if (updateOrdonnanceResponse.statusCode == 200 ||
          updateOrdonnanceResponse.statusCode == 201 ||
          updateOrdonnanceResponse.statusCode == 202 ||
          updateOrdonnanceResponse.statusCode == 203) {
        success2 = true;
      } else {
        success2 = false;
      }
    } catch (e) {
      print(e.toString());
    }
    List<String> nouveauBilan = [];
    if (hemoglobine == true) {
      nouveauBilan.add('Hémoglobine');
    }
    if (vgm == true) {
      nouveauBilan.add('VGM');
    }
    if (tcmh == true) {
      nouveauBilan.add('TCMH');
    }
    if (globulesBlancs == true) {
      nouveauBilan.add('Globules blancs');
    }
    if (polynucleairesNeutrophiles == true) {
      nouveauBilan.add('Polynucléaires neutrophiles');
    }
    if (lymphocyte == true) {
      nouveauBilan.add('Lymphocyte');
    }
    if (plaquettes == true) {
      nouveauBilan.add('Plaquettes');
    }
    if (vitesseDeSedimentation == true) {
      nouveauBilan.add('Vitesse de sédimentation');
    }
    if (proteineCReactive == true) {
      nouveauBilan.add('Protéine C réactive');
    }
    if (asat == true) {
      nouveauBilan.add('ASAT');
    }
    if (alat == true) {
      nouveauBilan.add('ALAT');
    }
    if (ggt == true) {
      nouveauBilan.add('GGT');
    }
    if (pal == true) {
      nouveauBilan.add('PAL');
    }
    if (creatinine == true) {
      nouveauBilan.add('Créatinine');
    }
    if (ferritinemie == true) {
      nouveauBilan.add('Ferritinémie');
    }
    if (ecbu == true) {
      nouveauBilan.add('ECBU');
    }
    if (serologieHepatiteC == true) {
      nouveauBilan.add('Sérologie hépatite C');
    }
    if (serologieHepatiteB == true) {
      nouveauBilan.add('Sérologie hépatite B');
    }
    String askForBilanURL =
        'http://192.168.1.16:4000/doctors/${widget.doctor.id.toString()}/patients/$patientIdString/newBilan';
    if (existeBilanNonValide == false) {
      try {
        var askForBilanResponse = await http.post("$askForBilanURL",
            body: json.encode({"type_bilan": nouveauBilan}),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${widget.token}'
            });
        if (askForBilanResponse.statusCode == 200 ||
            askForBilanResponse.statusCode == 201 ||
            askForBilanResponse.statusCode == 202 ||
            askForBilanResponse.statusCode == 203) {
          success3 = true;
        } else {
          success3 = false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
    Future.delayed(Duration(milliseconds: 1000), () {
      if (success1 && success2 && success3) {
        enregistrerAvecSuccess(context);
        Future.delayed(Duration(milliseconds: 1000), () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeDoctor(
              doctor: widget.doctor,
              token: widget.token,
            ),
          ));
        });
      } else {
        Future.delayed(Duration(milliseconds: 1000), () {
          erreurEnregistrement(context);
        });
      }
    });
  }

  Column createAllScores() {
    return Column(children: [
      createScore(scoreNames[0], scoreResults[0], 0, widget.patient),
      createScore(scoreNames[1], scoreResults[1], 1, widget.patient),
      createScore(scoreNames[2], scoreResults[2], 2, widget.patient),
      // createScoreJamar(scoreNames[3], scoreResults[3], 3, widget.patient),
    ]);
  }

  Card createScoreJamar(
      String typeScore, String score, int index, Patient patient) {
    String dateCalcul;
    String dateValidation;
    String dateDemande;
    List<String> allDates = getDates(patient, typeScore);
    dateDemande = allDates[0];
    dateCalcul = allDates[1];
    dateValidation = allDates[2];
    return Card(
      shadowColor: null,
      shape: null,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          margin: EdgeInsets.only(right: 5.0, left: 5.0),
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: cyan2, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: typeScore + " : ",
                      style: cyan16Bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date demandé :  ",
                      style: black16Bold,
                      children: <TextSpan>[
                        TextSpan(text: "$dateDemande", style: black14Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date rempli :  ",
                      style: black16Bold,
                      children: <TextSpan>[
                        TextSpan(text: "$dateCalcul", style: black14Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date validé :  ",
                      style: black16Bold,
                      children: <TextSpan>[
                        TextSpan(text: "$dateValidation", style: black14Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Résultat ",
                      style: cyan16Bold,
                      children: <TextSpan>[
                        TextSpan(text: score, style: black18Normal),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new FlatButton(
                          onPressed: () {},
                          focusColor: cyan2,
                          hoverColor: cyan2,
                          splashColor: cyan2,
                          color: cyan2,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Détails',
                                  style: white16Bold,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Icon(
                                    Icons.info,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => (HistoriqueScore(
                                    historiqueArguments: HistoriqueArguments(
                                        patient: widget.patient,
                                        typeScore: typeScore)))));
                          },
                          focusColor: cyan2,
                          hoverColor: cyan2,
                          splashColor: cyan2,
                          color: cyan2,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Voir historique',
                                  style: white16Bold,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Icon(
                                    FontAwesomeIcons.history,
                                    size: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      (!testRempli[index] && !testValidated[index])
                          ? ((!testDemanded[index])
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: new FlatButton(
                                    onPressed: () {
                                      Future.delayed(
                                          Duration(milliseconds: 100), () {
                                        if (mounted == true) {
                                          setState(() {
                                            testDemanded[index] = true;
                                          });
                                        }
                                      });
                                    },
                                    focusColor: Colors.green,
                                    hoverColor: Colors.green,
                                    splashColor: Colors.green,
                                    color: Colors.green,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Demander test',
                                                style: white14Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0),
                                                child: Icon(
                                                  FontAwesomeIcons.fileAlt,
                                                  size: 14.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: new RaisedButton(
                                    onPressed: null,
                                    focusColor: Colors.red,
                                    hoverColor: Colors.red,
                                    splashColor: Colors.red,
                                    disabledColor: Colors.red,
                                    color: Colors.red,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Test demandé',
                                                style: white14Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0),
                                                child: Icon(
                                                  FontAwesomeIcons.fileAlt,
                                                  size: 14.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      Spacer(),
                      (testDemanded[index] && testRempli[index])
                          ? ((testValidated[index])
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: new RaisedButton(
                                    onPressed: null,
                                    focusColor: Colors.green,
                                    hoverColor: Colors.green,
                                    splashColor: Colors.green,
                                    disabledColor: Colors.lightGreen[800],
                                    color: Colors.green,
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Test validé',
                                            style: white14Bold,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0),
                                            child: Icon(
                                              FontAwesomeIcons.checkCircle,
                                              size: 18.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: new FlatButton(
                                    onPressed: () {
                                      validerTest(typeScore);
                                    },
                                    focusColor: Colors.green,
                                    hoverColor: Colors.green,
                                    splashColor: Colors.green,
                                    color: Colors.green,
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Valider test',
                                            style: white14Bold,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0),
                                            child: Icon(
                                              FontAwesomeIcons.checkCircle,
                                              size: 18.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> getDates(Patient patient, String typeScore) {
    DateTime dateDemandee;
    DateTime dateValidationn;
    DateTime dateCalcull;
    String dateCalcul = "";
    String dateValidation = "";
    String dateDemande = "";
    List<String> allDates = [];
    switch (typeScore) {
      case "JADAS":
        List<Jadas> testsJadas = patient.jadas;
        if (testsJadas != null) {
          DateFormat formatter;
          initializeDateFormatting('fr');
          formatter = DateFormat('d MMMM yyyy  hh:mm', 'fr');
          if (testsJadas.isNotEmpty) {
            if (patient.jadas[0].dateDemande != null) {
              dateDemandee = patient.jadas[0].dateDemande;
              dateDemande = formatter.format(
                dateDemandee,
              );
            } else {
              dateDemande = "Pas encore demandé";
            }
          } else {
            dateDemande = "Pas encore demandé";
          }
          if (testsJadas.isNotEmpty) {
            if (patient.jadas[0].dateCalcul != null) {
              dateCalcull = patient.jadas[0].dateCalcul;
              dateCalcul = formatter.format(
                dateCalcull,
              );
            } else {
              dateCalcul = "Pas encore rempli";
            }
          } else {
            dateCalcul = "Pas encore rempli";
          }
          if (testsJadas.isNotEmpty) {
            if (patient.jadas[0].dateValidation != null) {
              dateValidationn = patient.jadas[0].dateValidation;
              dateValidation = formatter.format(
                dateValidationn,
              );
            } else {
              dateValidation = "Pas encore validé";
            }
          } else {
            dateValidation = "Pas encore validé";
          }
          allDates.addAll([dateDemande, dateCalcul, dateValidation]);
        } else {
          allDates.addAll(
              ["Pas encore demandé", "Pas encore rempli", "Pas encore validé"]);
        }
        break;
      case "JSPADA":
        List<Jspada> testsJspada = patient.jspada;
        if (testsJspada != null) {
          DateFormat formatter;
          initializeDateFormatting('fr');
          formatter = DateFormat('d MMMM yyyy  hh:mm', 'fr');
          if (testsJspada.isNotEmpty) {
            if (patient.jspada[0].dateDemande != null) {
              dateDemandee = patient.jspada[0].dateDemande;
              dateDemande = formatter.format(
                dateDemandee,
              );
            } else {
              dateDemande = "Pas encore demandé";
            }
          } else {
            dateDemande = "Pas encore demandé";
          }
          if (patient.jspada.isNotEmpty) {
            if (patient.jspada[0].dateCalcul != null) {
              dateCalcull = patient.jspada[0].dateCalcul;
              dateCalcul = formatter.format(
                dateCalcull,
              );
            } else {
              dateCalcul = "Pas encore rempli";
            }
          } else {
            dateCalcul = "Pas encore rempli";
          }
          if (patient.jspada.isNotEmpty) {
            if (patient.jspada[0].dateValidation != null) {
              dateValidationn = patient.jspada[0].dateValidation;
              dateValidation = formatter.format(
                dateValidationn,
              );
            } else {
              dateValidation = "Pas encore validé";
            }
          } else {
            dateValidation = "Pas encore validé";
          }
          allDates.addAll([dateDemande, dateCalcul, dateValidation]);
        } else {
          allDates.addAll(
              ["Pas encore demandé", "Pas encore rempli", "Pas encore validé"]);
        }
        break;

      case "CHAQ":
        List<Chaq> testsChaq = patient.chaq;
        if (testsChaq != null) {
          DateFormat formatter;
          initializeDateFormatting('fr');
          formatter = DateFormat('d MMMM yyyy  hh:mm', 'fr');
          if (testsChaq.isNotEmpty) {
            if (patient.chaq[0].dateDemande != null) {
              dateDemandee = patient.chaq[0].dateDemande;
              dateDemande = formatter.format(
                dateDemandee,
              );
            } else {
              dateDemande = "Pas encore demandé";
            }
          } else {
            dateDemande = "Pas encore demandé";
          }
          if (patient.chaq.isNotEmpty) {
            if (patient.chaq[0].dateCalcul != null) {
              dateCalcull = patient.chaq[0]?.dateCalcul;
              dateCalcul = formatter.format(
                dateCalcull,
              );
            } else {
              dateCalcul = "Pas encore rempli";
            }
          } else {
            dateCalcul = "Pas encore rempli";
          }
          if (patient.chaq.isNotEmpty) {
            if (patient.chaq[0].dateValidation != null) {
              dateValidationn = patient.chaq[0].dateValidation;
              dateValidation = formatter.format(
                dateValidationn,
              );
            } else {
              dateValidation = "Pas encore validé";
            }
          } else {
            dateValidation = "Pas encore validé";
          }
          allDates.addAll([dateDemande, dateCalcul, dateValidation]);
        } else {
          allDates.addAll(
              ["Pas encore demandé", "Pas encore rempli", "Pas encore validé"]);
        }
        break;
      case "JAMAR":
        List<Jamar> testsJamar = patient.jamar;
        if (testsJamar != null) {
          DateFormat formatter;
          initializeDateFormatting('fr');
          formatter = DateFormat('d MMMM yyyy  hh:mm', 'fr');
          if (testsJamar.isNotEmpty) {
            if (patient.jamar[0].dateDemande != null) {
              dateDemandee = patient.jamar[0].dateDemande;
              dateDemande = formatter.format(
                dateDemandee,
              );
            } else {
              dateDemande = "Pas encore demandé";
            }
          } else {
            dateDemande = "Pas encore demandé";
          }
          if (patient.jamar.isNotEmpty) {
            if (patient.jamar[0].dateCalcul != null) {
              dateCalcull = patient.jamar[0].dateCalcul;
              dateCalcul = formatter.format(
                dateCalcull,
              );
            } else {
              dateCalcul = "Pas encore rempli";
            }
          } else {
            dateCalcul = "Pas encore rempli";
          }
          if (patient.jamar.isNotEmpty) {
            if (patient.jamar[0].dateValidation != null) {
              dateValidationn = patient.jamar[0].dateValidation;
              dateValidation = formatter.format(
                dateValidationn,
              );
            } else {
              dateValidation = "Pas encore validé";
            }
          } else {
            dateValidation = "Pas encore validé";
          }
          allDates.addAll([dateDemande, dateCalcul, dateValidation]);
        } else {
          allDates.addAll(
              ["Pas encore demandé", "Pas encore rempli", "Pas encore validé"]);
        }
        break;
    }
    return allDates;
  }

  Card createScore(String typeScore, String score, int index, Patient patient) {
    String dateCalcul;
    String dateValidation;
    String dateDemande;
    List<String> allDates = getDates(patient, typeScore);
    dateDemande = allDates[0];
    dateCalcul = allDates[1];
    dateValidation = allDates[2];
    return Card(
      shadowColor: null,
      shape: null,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          margin: EdgeInsets.only(right: 5.0, left: 5.0),
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: cyan2, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: typeScore + " : ",
                      style: cyan16Bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date demandé :  ",
                      style: black16Bold,
                      children: <TextSpan>[
                        TextSpan(text: "$dateDemande", style: black14Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date rempli :  ",
                      style: black16Bold,
                      children: <TextSpan>[
                        TextSpan(text: "$dateCalcul", style: black14Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date validé :  ",
                      style: black16Bold,
                      children: <TextSpan>[
                        TextSpan(text: "$dateValidation", style: black14Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Résultat : ",
                      style: cyan18Bold,
                      children: <TextSpan>[
                        TextSpan(text: score, style: black16Bold),
                      ],
                    ),
                  ),
                  (typeScore == "JSPADA")
                      ? RichText(
                          text: TextSpan(
                            text: "NB : ",
                            style: black16Bold,
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "VSouCP n\' était pas prise en considération.",
                                  style: black14Normal),
                            ],
                          ),
                        )
                      : Container(),
                  Row(
                    children: [
                      Flexible(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: new FlatButton(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => (HistoriqueScore(
                                      historiqueArguments: HistoriqueArguments(
                                          patient: widget.patient,
                                          typeScore: typeScore)))));
                            },
                            focusColor: cyan2,
                            hoverColor: cyan2,
                            splashColor: cyan2,
                            color: cyan2,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Historique',
                                    style: white14Bold,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3.0),
                                    child: Icon(
                                      FontAwesomeIcons.history,
                                      size: 11.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      (!testRempli[index] && !testValidated[index])
                          ? ((!testDemanded[index])
                              ? Flexible(
                                  flex: 8,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: new FlatButton(
                                        padding: EdgeInsets.only(
                                            left: 9.0, right: 9.0),
                                        onPressed: () {
                                          Future.delayed(
                                              Duration(milliseconds: 100), () {
                                            if (mounted == true) {
                                              setState(() {
                                                testDemanded[index] = true;
                                              });
                                            }
                                          });
                                          demanderTest(typeScore);
                                        },
                                        focusColor: Colors.green,
                                        hoverColor: Colors.green,
                                        splashColor: Colors.green,
                                        color: Colors.green,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Demander test',
                                                style: white14Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3.0),
                                                child: Icon(
                                                  FontAwesomeIcons.fileAlt,
                                                  size: 12.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Flexible(
                                  flex: 8,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: new RaisedButton(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        onPressed: null,
                                        focusColor: Colors.red,
                                        hoverColor: Colors.red,
                                        splashColor: Colors.red,
                                        disabledColor: Colors.red,
                                        color: Colors.red,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Test demandé',
                                                style: white14Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3.0),
                                                child: Icon(
                                                  FontAwesomeIcons.fileAlt,
                                                  size: 12.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                      (testDemanded[index] && testRempli[index])
                          ? ((testValidated[index])
                              ? Flexible(
                                  flex: 7,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: new RaisedButton(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        onPressed: null,
                                        focusColor: Colors.green,
                                        hoverColor: Colors.green,
                                        splashColor: Colors.green,
                                        disabledColor: Colors.lightGreen[800],
                                        color: Colors.green,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Test validé',
                                                style: white14Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Icon(
                                                  FontAwesomeIcons.checkCircle,
                                                  size: 15.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Flexible(
                                  flex: 7,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: new FlatButton(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        onPressed: () {
                                          validerTest(typeScore);
                                          setState(() {
                                            testValidated[index] = true;
                                          });
                                        },
                                        focusColor: Colors.green,
                                        hoverColor: Colors.green,
                                        splashColor: Colors.green,
                                        color: Colors.green,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Valider test',
                                                style: white14Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Icon(
                                                  FontAwesomeIcons.checkCircle,
                                                  size: 15.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          : Container(
                              height: 0,
                              width: 0,
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gris1,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 10.0, right: 14.0, top: 6.0),
              child: Icon(FontAwesomeIcons.userInjured, size: 18),
            ),
            Expanded(
              child: Text(
                widget.patient.prenom + '  ' + widget.patient.nom,
                style: white18Bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: Scrollbar(
        radius: Radius.circular(15.0),
        isAlwaysShown: true,
        controller: scrollController,
        child: new SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: gris1,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 8.0),
                            child: Text(
                              "Patient",
                              style: cyan19Bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 10.0, top: 10.0, right: 5.0, left: 5.0),
                          padding: EdgeInsets.only(right: 10.0, left: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: cyan2, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Nom :  ",
                                      style: black16Bold,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "${widget.patient?.nom}",
                                            style: black16Normal),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Prénom :  ",
                                      style: black16Bold,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "${widget.patient?.prenom}",
                                            style: black16Normal),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "N° dossier :  ",
                                      style: black16Bold,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                "${widget.patient.numDossier}",
                                            style: black16Normal),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Age :  ",
                                      style: black16Bold,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "${widget.patient?.age}",
                                            style: black16Normal),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Diagnostic :  ",
                                      style: black16Bold,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                "${widget.patient?.diagnostic}",
                                            style: black16Normal),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Téléphone :  ",
                                      style: black16Bold,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                "${widget.patient?.telephone}",
                                            style: black16Normal),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                        child: Text(
                          "Résultat du dernier diagnostic",
                          style: cyan19Bold,
                        ),
                      ),
                      Column(
                        children: [createAllScores()],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  "Evaluation globale faite par le médecin ?",
                                  style: cyan19Bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(child: sliderLimit(0.0), flex: 1),
                                  Flexible(
                                    flex: 6,
                                    child: Container(
                                      width: 250,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: SliderTheme(
                                          data:
                                              SliderTheme.of(context).copyWith(
                                            activeTrackColor: cyan3,
                                            inactiveTrackColor: cyan2,
                                            showValueIndicator:
                                                ShowValueIndicator.always,
                                            thumbColor: Colors.blueAccent,
                                            overlayColor:
                                                Colors.purple.withAlpha(32),
                                            overlayShape:
                                                RoundSliderOverlayShape(
                                                    overlayRadius: 16.0),
                                            activeTickMarkColor: cyan2,
                                            inactiveTickMarkColor: cyan2,
                                            valueIndicatorShape:
                                                PaddleSliderValueIndicatorShape(),
                                            valueIndicatorColor:
                                                Colors.blueAccent,
                                            valueIndicatorTextStyle:
                                                white16Bold,
                                          ),
                                          child: Slider(
                                            value:
                                                evaluationGlobaleFaiteParMedecin,
                                            min: 0.0,
                                            max: 10.0,
                                            divisions: 10,
                                            label:
                                                '$evaluationGlobaleFaiteParMedecin',
                                            onChanged: (value) {
                                              if (mounted == true) {
                                                setState(
                                                  () {
                                                    evaluationGlobaleFaiteParMedecin =
                                                        value;
                                                  },
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(child: sliderLimit(10.0), flex: 1),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Ordonnance",
                                style: cyan19Bold,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Column(children: [
                        textFormFieldTextWithoutValidator(
                            controller1,
                            'Entrez un médicament',
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                FontAwesomeIcons.pills,
                                color: gris2,
                                size: 18,
                              ),
                            )),
                        textFormFieldTextWithoutValidator(
                            controller2,
                            'Entrez un médicament',
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                FontAwesomeIcons.pills,
                                color: gris2,
                                size: 18,
                              ),
                            )),
                        textFormFieldTextWithoutValidator(
                            controller3,
                            'Entrez un médicament',
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                FontAwesomeIcons.pills,
                                color: gris2,
                                size: 18,
                              ),
                            )),
                        textFormFieldTextWithoutValidator(
                            controller4,
                            'Entrez un médicament',
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                FontAwesomeIcons.pills,
                                color: gris2,
                                size: 18,
                              ),
                            )),
                        textFormFieldTextWithoutValidator(
                            controller5,
                            'Entrez un médicament',
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                FontAwesomeIcons.pills,
                                color: gris2,
                                size: 18,
                              ),
                            )),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 4,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 8.0, top: 5.0),
                                  child: Text(
                                    "Biologie",
                                    style: cyan19Bold,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            existeBilanNonValide
                                ? Flexible(
                                    flex: 8,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ValiderBilans(
                                                          doctor: widget.doctor,
                                                          token: widget.token,
                                                          patient:
                                                              widget.patient)));
                                        },
                                        focusColor: cyan2,
                                        hoverColor: cyan2,
                                        splashColor: cyan2,
                                        color: cyan2,
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Voir les bilans demandés',
                                                style: white12Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6.0),
                                                child: Icon(
                                                  FontAwesomeIcons.fileAlt,
                                                  size: 14.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      !existeBilanNonValide
                          ? Column(
                              children: [
                                flatButtonMultipleChoice(
                                    title: 'Hémoglobine',
                                    initValue: hemoglobine,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          hemoglobine = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'VGM',
                                    initValue: vgm,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          vgm = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'TCMH',
                                    initValue: tcmh,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          tcmh = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Globules blancs',
                                    initValue: globulesBlancs,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          globulesBlancs = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Polynucléaires neutrophiles',
                                    initValue: polynucleairesNeutrophiles,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          polynucleairesNeutrophiles = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Lymphocyte',
                                    initValue: lymphocyte,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          lymphocyte = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Plaquettes',
                                    initValue: plaquettes,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          plaquettes = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Vitesse de sédimentation',
                                    initValue: vitesseDeSedimentation,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          vitesseDeSedimentation = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Protéine C réactive',
                                    initValue: proteineCReactive,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          proteineCReactive = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'ASAT',
                                    initValue: asat,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          asat = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'ALAT',
                                    initValue: alat,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          alat = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'GGT',
                                    initValue: ggt,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          ggt = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'PAL',
                                    initValue: pal,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          pal = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Créatinine',
                                    initValue: creatinine,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          creatinine = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Ferritinémie',
                                    initValue: ferritinemie,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          ferritinemie = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'ECBU',
                                    initValue: ecbu,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          ecbu = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Sérologie hépatite C',
                                    initValue: serologieHepatiteC,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          serologieHepatiteC = newValue;
                                        });
                                      }
                                    }),
                                flatButtonMultipleChoice(
                                    title: 'Sérologie hépatite B',
                                    initValue: serologieHepatiteB,
                                    onChanged: (newValue) {
                                      if (this.mounted) {
                                        setState(() {
                                          serologieHepatiteB = newValue;
                                        });
                                      }
                                    }),
                              ],
                            )
                          : Container(),
                      Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: new FlatButton(
                              minWidth: 60.0,
                              onPressed: () {
                                saveOrdonnanceAndEvaluationAndBilan(
                                    widget.patient.id.toString());
                              },
                              padding: EdgeInsets.only(left: 10, right: 10),
                              focusColor: cyan2,
                              hoverColor: cyan2,
                              splashColor: cyan2,
                              color: cyan2,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    existeBilanNonValide
                                        ? Text(
                                            'Enregistrer l\'ordonnance',
                                            style: white14Bold,
                                          )
                                        : Text(
                                            'Enregistrer l\'ordonnance et les bilans',
                                            style: white14Bold,
                                          ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Icon(Icons.save,
                                          color: Colors.white, size: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
