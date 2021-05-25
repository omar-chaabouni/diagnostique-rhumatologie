import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rhumatologie/models/chaq.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/historique_arguments.dart';
import 'package:rhumatologie/models/jadas.dart';
import 'package:rhumatologie/models/jamar.dart';
import 'package:rhumatologie/models/jspada.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HistoriqueScore extends StatefulWidget {
  HistoriqueArguments historiqueArguments;
  Patient patient;
  Doctor doctor;
  String token;
  HistoriqueScore(
      {this.historiqueArguments, this.doctor, this.token, this.patient});
  @override
  _HistoriqueScoreState createState() => _HistoriqueScoreState();
}

class _HistoriqueScoreState extends State<HistoriqueScore> {
  var allHistoriqueCards = <Card>[];
  List<Jadas> testsJadas = [];
  List<Jamar> testsJamar = [];
  List<Chaq> testsChaq = [];
  List<Jspada> testsJspada = [];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getHistorique();
    fillHistoriqueCards();
  }

  deleteTest(String typeScore) async {
    String deleteTestURL =
        '$baseUrl/doctors/${widget.doctor.id}/patients/${widget.patient.id}/';
    if (typeScore == "JADAS") {
      deleteTestURL = deleteTestURL + "deleteJADAS";
    } else if (typeScore == "JSPADA") {
      deleteTestURL = deleteTestURL + "deleteJSPADA";
    } else if (typeScore == "CHAQ") {
      deleteTestURL = deleteTestURL + "deleteCHAQ";
    } else {
      deleteTestURL = deleteTestURL + "deleteJamar";
    }
    try {
      var demanderTestResponse = await http.delete("$deleteTestURL", headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}'
      });
      if (demanderTestResponse.statusCode == 200 ||
          demanderTestResponse.statusCode == 201 ||
          demanderTestResponse.statusCode == 202 ||
          demanderTestResponse.statusCode == 203) {
        await enregistrerAvecSuccess(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeDoctor(
            doctor: widget.doctor,
            token: widget.token,
          ),
        ));
      } else {
        erreurEnregistrement(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String getStateString(int state) {
    switch (state) {
      case 0:
        return "Demandé";
        break;
      case 1:
        return "Rempli";
        break;
      case 2:
        return "Validé";
        break;
      default:
        return "Demandé";
    }
  }

  fillHistoriqueCards() {
    if (testsJadas.isNotEmpty) {
      for (int i = 0; i < testsJadas.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateCalcull;
        String dateCalcul = "";
        String dateValidation = "";
        String dateDemande = "";
        final DateFormat formatter = DateFormat('d MMMM yyyy', 'fr');
        initializeDateFormatting('fr');
        String state;
        state = getStateString(testsJadas[i].state);
        if (testsJadas[i].dateDemande != null) {
          dateDemandee = testsJadas[i].dateDemande;
          dateDemande = formatter.format(dateDemandee);
        } else {
          dateDemande = "Pas encore demandé";
        }
        if (testsJadas[i].dateCalcul != null) {
          dateCalcull = testsJadas[i].dateCalcul;
          dateCalcul = formatter.format(dateCalcull);
        } else {
          dateCalcul = "Pas encore rempli";
        }
        if (testsJadas[i].dateValidation != null) {
          dateValidationn = testsJadas[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            i,
            dateDemande.toString(),
            dateValidation.toString(),
            dateCalcul.toString(),
            state,
            testsJadas[i].score)); // testJadas[i].score
      }
    }
    if (testsChaq.isNotEmpty) {
      for (int i = 0; i < testsChaq.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateCalcull;
        String dateCalcul = "";
        String dateValidation = "";
        String dateDemande = "";
        final DateFormat formatter = DateFormat('d MMMM yyyy', 'fr');
        initializeDateFormatting('fr');
        String state;
        state = getStateString(testsChaq[i].state);
        if (testsChaq[i].dateDemande != null) {
          dateDemandee = testsChaq[i].dateDemande;
          dateDemande = formatter.format(dateDemandee);
        } else {
          dateDemande = "Pas encore demandé";
        }
        if (testsChaq[i].dateCalcul != null) {
          dateCalcull = testsChaq[i].dateCalcul;
          dateCalcul = formatter.format(dateCalcull);
        } else {
          dateCalcul = "Pas encore rempli";
        }
        if (testsChaq[i].dateValidation != null) {
          dateValidationn = testsChaq[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            i,
            dateDemande.toString(),
            dateValidation.toString(),
            dateCalcul.toString(),
            state,
            testsChaq[i].score));
      }
    }
    if (testsJspada.isNotEmpty) {
      for (int i = 0; i < testsJspada.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateCalcull;
        String dateCalcul = "";
        String dateValidation = "";
        String dateDemande = "";
        final DateFormat formatter = DateFormat('d MMMM yyyy', 'fr');
        initializeDateFormatting('fr');
        String state;
        state = getStateString(testsJspada[i].state);
        if (testsJspada[i].dateDemande != null) {
          dateDemandee = testsJspada[i].dateDemande;
          dateDemande = formatter.format(dateDemandee);
        } else {
          dateDemande = "Pas encore demandé";
        }
        if (testsJspada[i].dateCalcul != null) {
          dateCalcull = testsJspada[i].dateCalcul;
          dateCalcul = formatter.format(dateCalcull);
        } else {
          dateCalcul = "Pas encore rempli";
        }
        if (testsJspada[i].dateValidation != null) {
          dateValidationn = testsJspada[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            i,
            dateDemande.toString(),
            dateValidation.toString(),
            dateCalcul.toString(),
            state,
            testsJspada[i].score)); // testJspada[i].score
      }
    }
    if (testsJamar.isNotEmpty) {
      for (int i = 0; i < testsJamar.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateCalcull;
        String dateCalcul = "";
        String dateValidation = "";
        String dateDemande = "";
        final DateFormat formatter = DateFormat('d MMMM yyyy', 'fr');
        initializeDateFormatting('fr');
        String state;
        state = getStateString(testsJamar[i].state);
        if (testsJamar[i].dateDemande != null) {
          dateDemandee = testsJamar[i].dateDemande;
          dateDemande = formatter.format(dateDemandee);
        } else {
          dateDemande = "Pas encore demandé";
        }
        if (testsJamar[i].dateCalcul != null) {
          dateCalcull = testsJamar[i].dateCalcul;
          dateCalcul = formatter.format(dateCalcull);
        } else {
          dateCalcul = "Pas encore rempli";
        }
        if (testsJamar[i].dateValidation != null) {
          dateValidationn = testsJamar[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            i,
            dateDemande.toString(),
            dateValidation.toString(),
            dateCalcul.toString(),
            state,
            testsJamar[i].score));
      }
    } else {
      if (allHistoriqueCards.isEmpty) {
        allHistoriqueCards.add(historiqueNExistePas());
      }
    }
  }

  void getHistorique() async {
    if (widget.historiqueArguments.typeScore == 'JADAS') {
      testsJadas = widget.historiqueArguments.patient.jadas;
    }
    if (widget.historiqueArguments.typeScore == 'JSPADA') {
      testsJspada = widget.historiqueArguments.patient.jspada;
    }
    if (widget.historiqueArguments.typeScore == 'JAMAR') {
      testsJamar = widget.historiqueArguments.patient.jamar;
    }
    if (widget.historiqueArguments.typeScore == 'CHAQ') {
      testsChaq = widget.historiqueArguments.patient.chaq;
    }
  }

  Card historiqueCard(BuildContext context, int index, String dateDemande,
      String dateValidation, String dateRempli, String state, String resultat) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              margin: EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
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
                          text: "Date demandé :  ",
                          style: black16Bold,
                          children: <TextSpan>[
                            (dateDemande == "Pas encore demandé")
                                ? TextSpan(
                                    text: dateDemande, style: red16Normal)
                                : TextSpan(
                                    text: dateDemande, style: black16Normal),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Date rempli :  ",
                          style: black16Bold,
                          children: <TextSpan>[
                            (dateRempli == "Pas encore rempli")
                                ? TextSpan(text: dateRempli, style: red16Normal)
                                : TextSpan(
                                    text: dateRempli, style: black16Normal),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Date validation :  ",
                          style: black16Bold,
                          children: <TextSpan>[
                            (dateValidation == "Pas encore validé")
                                ? TextSpan(
                                    text: dateValidation, style: red16Normal)
                                : TextSpan(
                                    text: dateValidation, style: black16Normal),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Etat :  ",
                                style: black16Bold,
                                children: <TextSpan>[
                                  TextSpan(text: state, style: black16Normal),
                                ],
                              ),
                            ),
                            Spacer(),
                            ((index == 0) && (resultat == null))
                                ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      margin: EdgeInsets.all(0.0),
                                      child: FlatButton(
                                        height: 32,
                                        focusColor: Colors.red,
                                        hoverColor: Colors.white,
                                        highlightColor: Colors.grey[200],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        minWidth: 12.0,
                                        color: Colors.grey[200],
                                        onPressed: () {
                                          deleteTest(widget
                                              .historiqueArguments.typeScore);
                                        },
                                        child: Icon(FontAwesomeIcons.trashAlt,
                                            size: 16, color: Colors.red),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      ((state != "Demandé") && (resultat != null))
                          ? Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Résultat : ",
                                    style: black16Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: resultat, style: black16Normal),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                (index == 0)
                                    ? Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          margin: EdgeInsets.all(0.0),
                                          child: FlatButton(
                                            height: 32,
                                            focusColor: Colors.red,
                                            hoverColor: Colors.white,
                                            highlightColor: Colors.grey[200],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            minWidth: 12.0,
                                            color: Colors.grey[200],
                                            onPressed: () {
                                              deleteTest(widget
                                                  .historiqueArguments
                                                  .typeScore);
                                            },
                                            child: Icon(
                                                FontAwesomeIcons.trashAlt,
                                                size: 16,
                                                color: Colors.red),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
                    const EdgeInsets.only(bottom: 10.0, right: 14.0, top: 10.0),
                child: Icon(FontAwesomeIcons.history, size: 16),
              ),
              Text(
                "Historique du score de " +
                    widget.historiqueArguments.typeScore,
                style: white16Bold,
              ),
            ],
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return Scrollbar(
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
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 8.0),
                            child: Text(
                              "Patient",
                              style: cyan20Bold,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 8.0),
                            child: RichText(
                              text: TextSpan(
                                text: "Patient :  ",
                                style: black18Bold,
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${widget.historiqueArguments.patient.prenom} ${widget.historiqueArguments.patient.nom}",
                                      style: black16Normal),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 8.0),
                            child: RichText(
                              text: TextSpan(
                                text: "Diagnostic :  ",
                                style: black18Bold,
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${widget.historiqueArguments.patient.diagnostic}",
                                      style: black16Normal),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 8.0),
                            child: Text(
                              "Historique du score",
                              style: cyan20Bold,
                            ),
                          ),
                          // Column(
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: allHistoriqueCards.length,
                              itemBuilder: (BuildContext context, int index) {
                                return allHistoriqueCards[index];
                              }),
                          // children: allHistoriqueCards,
                          // ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
