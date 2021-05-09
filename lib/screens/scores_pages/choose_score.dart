import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
class ChooseScore extends StatefulWidget {
  Patient patient;
  String token;
  ChooseScore({this.patient, this.token});
  @override
  _ChooseScoreState createState() => _ChooseScoreState();
}

// ignore: camel_case_types
class _ChooseScoreState extends State<ChooseScore> {
  bool scores = false;
  var scoresCards = <Card>[];
  ScrollController scrollController = ScrollController();
  List<String> listOfTiltlesOfScores = [
    "Test de score JADAS",
    "Test de score JSPADA",
    "Test de score CHAQ",
    // "Test de score JAMAR",
  ];
  List<String> listOfScores = [
    "JADAS",
    "JSPADA",
    "CHAQ",
    // "JAMAR",
  ];
  List<bool> existScores = [false, false, false];

  @override
  void initState() {
    super.initState();
    if (widget.patient.jadas.isNotEmpty) {
      if (widget.patient.jadas[0] != null) {
        if (widget.patient.jadas[0].state == 0) {
          existScores[0] = true;
          scores = true;
        }
      }
    }
    if (widget.patient.jspada.isNotEmpty) {
      if (widget.patient.jspada[0] != null) {
        if (widget.patient.jspada[0].state == 0) {
          existScores[1] = true;
          scores = true;
        }
      }
    }
    if (widget.patient.chaq.isNotEmpty) {
      if (widget.patient.chaq[0] != null) {
        if (widget.patient.chaq[0].state == 0) {
          existScores[2] = true;
          scores = true;
        }
      }
    }
    for (int i = 0; i < listOfScores.length; i++) {
      if (existScores[i] == true) {
        scoresCards.add(createRequestedScoreCard(
            listOfScores[i], context, widget.patient, widget.token));
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gris1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: (null),
          icon: Icon(FontAwesomeIcons.stethoscope,
              color: Colors.white, size: 20.0),
          label: Text(
            " Suivi",
            style: white20Bold,
          ),
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
            child: scores
                ? Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        scores
                                            ? RichText(
                                                text: TextSpan(
                                                  text: 'Votre docteur ',
                                                  style: black18Normal,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: "Dr. ",
                                                        style: cyan18Bold1_6),
                                                    TextSpan(
                                                        text:
                                                            "${widget.patient.docteur.prenom} ${widget.patient.docteur.nom} ",
                                                        style: cyan18Bold1_6),
                                                    TextSpan(
                                                        text:
                                                            ' vous demande de faire ces tests de score :'),
                                                  ],
                                                ),
                                              )
                                            : RichText(
                                                text: TextSpan(
                                                  text: 'Votre docteur ',
                                                  style: black18Normal,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: "Dr. ",
                                                        style: cyan18Bold1_6),
                                                    TextSpan(
                                                        text:
                                                            "${widget.patient.docteur.prenom} ${widget.patient.docteur.nom} ",
                                                        style: cyan18Bold1_6),
                                                    TextSpan(
                                                        text:
                                                            ' n\' a rien demandé.'),
                                                  ],
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  scores
                                      ? Column(
                                          children: scoresCards,
                                        )
                                      : SizedBox(height: 0),
                                  SizedBox(height: 15.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Votre docteur ',
                                        style: black18Normal,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: "Dr. ",
                                              style: cyan18Bold1_6),
                                          TextSpan(
                                              text: "Hanene Lassoued Ferjani ",
                                              style: cyan18Bold1_6),
                                          TextSpan(
                                              text:
                                                  ' n\'a rien demandé pour le moment.')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              scores
                                  ? Column(
                                      children: scoresCards,
                                    )
                                  : SizedBox(height: 0),
                              SizedBox(height: 15.0),
                            ],
                          ),
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
