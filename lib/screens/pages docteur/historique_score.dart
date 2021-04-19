import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rhumatologie/models/chaq.dart';
import 'package:rhumatologie/models/historique_arguments.dart';
import 'package:rhumatologie/models/jadas.dart';
import 'package:rhumatologie/models/jamar.dart';
import 'package:rhumatologie/models/jspada.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'package:intl/date_symbol_data_local.dart';

// ignore: must_be_immutable
class HistoriqueScore extends StatefulWidget {
  static const routeName = '/historique_score';
  HistoriqueArguments historiqueArguments;

  @override
  _HistoriqueScoreState createState() => _HistoriqueScoreState();
}

class _HistoriqueScoreState extends State<HistoriqueScore> {
  var allHistoriqueCards = <Card>[];
  List<Jadas> testsJadas = [];
  List<Jamar> testsJamar = [];
  List<Chaq> testsChaq = [];
  List<Jspada> testsJspada = [];

  @override
  void initState() {
    super.initState();
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.historiqueArguments = ModalRoute.of(context).settings.arguments;
    getHistorique();
    fillHistoriqueCards();
  }

  fillHistoriqueCards() {
    if (testsJadas.isNotEmpty) {
      for (int i = 0; i < testsJadas.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateRemplii;
        String dateRempli = "";
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
        if (testsJadas[i].dateRempli != null) {
          dateRemplii = testsJadas[i].dateRempli;
          dateRempli = formatter.format(dateRemplii);
        } else {
          dateRempli = "Pas encore rempli";
        }
        if (testsJadas[i].dateValidation != null) {
          dateValidationn = testsJadas[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            dateDemande.toString(),
            dateValidation.toString(),
            dateRempli.toString(),
            state,
            "40/60")); // testJadas[i].score
      }
    }
    if (testsChaq.isNotEmpty) {
      for (int i = 0; i < testsChaq.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateRemplii;
        String dateRempli = "";
        String dateValidation = "";
        String dateDemande = "";
        DateFormat formatter;
        initializeDateFormatting('fr');
        String state;
        state = getStateString(testsChaq[i].state);
        if (testsJadas[i].dateDemande != null) {
          dateDemandee = testsChaq[i].dateDemande;
          dateDemande = formatter.format(dateDemandee);
        } else {
          dateDemande = "Pas encore demandé";
        }
        if (testsChaq[i].dateRempli != null) {
          dateRemplii = testsChaq[i].dateRempli;
          dateRempli = formatter.format(dateRemplii);
        } else {
          dateRempli = "Pas encore rempli";
        }
        if (testsChaq[i].dateValidation != null) {
          dateValidationn = testsChaq[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            dateDemande.toString(),
            dateValidation.toString(),
            dateRempli.toString(),
            state,
            "40/60")); // testChaq[i].score
      }
    }
    if (testsJspada.isNotEmpty) {
      for (int i = 0; i < testsJspada.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateRemplii;
        String dateRempli = "";
        String dateValidation = "";
        String dateDemande = "";
        DateFormat formatter;
        initializeDateFormatting('fr');
        String state;
        state = getStateString(testsJspada[i].state);
        if (testsJspada[i].dateDemande != null) {
          dateDemandee = testsJspada[i].dateDemande;
          dateDemande = formatter.format(dateDemandee);
        } else {
          dateDemande = "Pas encore demandé";
        }
        if (testsJspada[i].dateRempli != null) {
          dateRemplii = testsJspada[i].dateRempli;
          dateRempli = formatter.format(dateRemplii);
        } else {
          dateRempli = "Pas encore rempli";
        }
        if (testsJspada[i].dateValidation != null) {
          dateValidationn = testsJspada[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            dateDemande.toString(),
            dateValidation.toString(),
            dateRempli.toString(),
            state,
            "40/60")); // testJspada[i].score
      }
    }
    if (testsJamar.isNotEmpty) {
      for (int i = 0; i < testsJamar.length; i++) {
        DateTime dateDemandee;
        DateTime dateValidationn;
        DateTime dateRemplii;
        String dateRempli = "";
        String dateValidation = "";
        String dateDemande = "";
        DateFormat formatter;
        initializeDateFormatting('fr');
        String state;
        state = getStateString(testsJamar[i].state);
        if (testsJamar[i].dateDemande != null) {
          dateDemandee = testsJamar[i].dateDemande;
          dateDemande = formatter.format(dateDemandee);
        } else {
          dateDemande = "Pas encore demandé";
        }
        if (testsJamar[i].dateRempli != null) {
          dateRemplii = testsJamar[i].dateRempli;
          dateRempli = formatter.format(dateRemplii);
        } else {
          dateRempli = "Pas encore rempli";
        }
        if (testsJamar[i].dateValidation != null) {
          dateValidationn = testsJamar[i].dateValidation;
          dateValidation = formatter.format(dateValidationn);
        } else {
          dateValidation = "Pas encore validé";
        }
        allHistoriqueCards.add(historiqueCard(
            context,
            dateDemande.toString(),
            dateValidation.toString(),
            dateRempli.toString(),
            state,
            "40/60")); // testJamar[i].score
      }
    } else {
      if (allHistoriqueCards.isEmpty) {
        allHistoriqueCards.add(historiqueNExistePas());
      }
    }
  }

  void getHistorique() {
    if (widget.historiqueArguments.typeScore == 'JADAS') {
      testsJadas = widget.historiqueArguments.patient.jadas;
    }
    if (widget.historiqueArguments.typeScore == 'JSPADA') {
      print('ahla');
      // testsJadas = widget.historiqueArguments.patient.jspada;
    }
    if (widget.historiqueArguments.typeScore == 'JAMAR') {
      print('ahla');
      // testsJadas = widget.historiqueArguments.patient.jamar;
    }
    if (widget.historiqueArguments.typeScore == 'CHAQ') {
      print('ahla');
      // testsJadas = widget.historiqueArguments.patient.chaq;
    }
  }

  @override
  Widget build(BuildContext context) {
    final HistoriqueArguments historiqueArguments =
        ModalRoute.of(context).settings.arguments;
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
                child: Icon(FontAwesomeIcons.history, size: 20),
              ),
              Text(
                "Historique du score de " + historiqueArguments.typeScore,
                style: white19Normal,
              ),
            ],
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return new SingleChildScrollView(
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
                          padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                          child: Text(
                            "Historique du score",
                            style: cyan20Bold,
                          ),
                        ),
                        Column(
                          children: allHistoriqueCards,
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
