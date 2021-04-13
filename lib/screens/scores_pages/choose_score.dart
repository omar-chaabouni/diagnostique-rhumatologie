import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

// ignore: camel_case_types
class ChooseScore extends StatefulWidget {
  @override
  _ChooseScoreState createState() => _ChooseScoreState();
}

// ignore: camel_case_types
class _ChooseScoreState extends State<ChooseScore> {
  bool scores = true;
  var scoresCards = <Card>[];

  List<String> listOfTiltlesOfScores = [
    "Test de score JADAS",
    "Test de score JSPADA",
    "Test de score CHAQ",
    "Test de score JAMAR",
  ];
  List<String> listOfScores = [
    "JADAS",
    "JSPADA",
    "CHAQ",
    "JAMAR",
  ];
  List<bool> existScores = [
    true,
    true,
    true,
    true,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (int i = 0; i < listOfScores.length; i++) {
      if (existScores[i]) {
        scoresCards
            .add(createRequestedScoreCard(listOfScores[i], context, "omar"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: (null),
          icon: Icon(FontAwesomeIcons.stethoscope, color: Colors.white),
          label: Text(
            " Diagnostic",
            style: white22Bold,
          ),
        ),
      ),
      body: scores
          ? Builder(
              builder: (BuildContext context) {
                return Container(
                  color: gris1,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                                            text: "Dr. ", style: cyan18Bold1_6),
                                        TextSpan(
                                            text: "Hanene Lassoued Ferjani ",
                                            style: cyan18Bold1_6),
                                        TextSpan(
                                            text:
                                                ' vous demande de faire ces tests de score :'),
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
              color: gris1,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                                        text: "Dr. ", style: cyan18Bold1_6),
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
    );
  }
}
