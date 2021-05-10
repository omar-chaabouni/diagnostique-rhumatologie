import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/models/chaq_arguments.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_4_chaq.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

// ignore: must_be_immutable
class Page3Chaq extends StatefulWidget {
  Patient patient;
  String token;
  Chaq2Arguments chaq2Args;
  Page3Chaq({this.patient, this.token, this.chaq2Args});
  @override
  _Page3ChaqState createState() => _Page3ChaqState();
}

class _Page3ChaqState extends State<Page3Chaq> {
  bool testDemanded = true;
  ScrollController scrollController = ScrollController();
  List<String> question_19 = [];
  List<String> question_20 = [];
  List<String> question_21 = [];
  List<String> question_22 = [];
  List<String> question_23 = [];
  List<String> question_24 = [];
  List<String> question_25 = [];
  List<String> question_26 = [];
  List<String> question_27 = [];
  int index_19 = 0;
  int index_20 = 0;
  int index_21 = 0;
  int index_22 = 0;
  int index_23 = 0;
  int index_24 = 0;
  int index_25 = 0;
  int index_26 = 0;
  int index_27 = 0;
  List categories = <String>[
    "Sans difficulté",
    "Avec quelque difficulté",
    "Avec beaucoup de difficuté",
    "Incapable de le faire",
    'Question inadaptée pour l\'âge',
  ];
  double sommeScore = 0;
  double nbrOfItems = 0;
  List<int> allQuestionsAtteindre = [];
  List<int> allQuestionsSaisirTenir = [];
  void calculEtEnvoiSomme() {
    allQuestionsAtteindre.addAll([index_19, index_20, index_21, index_22]);
    allQuestionsSaisirTenir
        .addAll([index_23, index_24, index_25, index_26, index_27]);
    allQuestionsAtteindre.removeWhere((item) => item == 4);
    allQuestionsSaisirTenir.removeWhere((item) => item == 4);
    nbrOfItems += allQuestionsAtteindre.length + allQuestionsSaisirTenir.length;
    sommeScore += allQuestionsAtteindre.reduce(max);
    sommeScore += allQuestionsSaisirTenir.reduce(max);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: (null),
          icon: Icon(FontAwesomeIcons.fileAlt, color: Colors.white, size: 20.0),
          label: Text(
            "Score CHAQ   Page 3/4",
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
                        child: testDemanded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 10.0),
                                    child: Text(
                                      "Atteindre".toUpperCase(),
                                      style: cyan20Bold,
                                    ),
                                  ),
                                  questionChaq(
                                      "Votre enfant est-il capable de"),
                                  questionChaq(
                                      "1. Attraper un objet lourd comme une grande boite de jeu ou des livres placés juste au dessus de sa tête ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_19,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_19) {
                                      this.index_19 = index_19;
                                      if (isChecked == false) {
                                        this.index_19 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_19 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "2. Se baisser pour ramasser un vêtement ou une feuille de papier par terre ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_20,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_20) {
                                      this.index_20 = index_20;
                                      if (isChecked == false) {
                                        this.index_20 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_20 = selected;
                                    }),
                                  ),
                                  questionChaq("3. Enfiler un pull ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_21,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_21) {
                                      this.index_21 = index_21;
                                      if (isChecked == false) {
                                        this.index_21 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_21 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "4. Tourner la tête pour regarder par dessus son épaule ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_22,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_22) {
                                      this.index_22 = index_22;
                                      if (isChecked == false) {
                                        this.index_22 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_22 = selected;
                                    }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 10.0),
                                    child: Text(
                                      "Saisir, Tenir".toUpperCase(),
                                      style: cyan20Bold,
                                    ),
                                  ),
                                  questionChaq(
                                      "Votre enfant est-il capable de"),
                                  questionChaq(
                                      "1. Ecrire ou gribouiller avec un crayon ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_23,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_23) {
                                      this.index_23 = index_23;
                                      if (isChecked == false) {
                                        this.index_23 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_23 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "2. Ouvrir une porte de voiture ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_24,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_24) {
                                      this.index_24 = index_24;
                                      if (isChecked == false) {
                                        this.index_24 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_24 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "3. Dévisser le couvercle d'un pot de confiture (qui a déja été ouvert) ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_25,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_25) {
                                      this.index_25 = index_25;
                                      if (isChecked == false) {
                                        this.index_25 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_25 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "4. Ouvrir et fermer un robinet ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_26,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_26) {
                                      this.index_26 = index_26;
                                      if (isChecked == false) {
                                        this.index_26 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_26 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "5. Ouvrir une porte en tournant la poignée ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_27,
                                    itemBuilder:
                                        (Checkbox cb, Text txt, int i) {
                                      return Flexible(
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                child: Center(
                                                  child: cb,
                                                ),
                                              ),
                                              Container(
                                                child: Text(txt.data,
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: black12Normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_27) {
                                      this.index_27 = index_27;
                                      if (isChecked == false) {
                                        this.index_27 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_27 = selected;
                                    }),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: new FlatButton(
                                        minWidth: 60.0,
                                        onPressed: () {
                                          calculEtEnvoiSomme();

                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => Page4Chaq(
                                              patient: widget.patient,
                                              token: widget.token,
                                              chaq3Args: Chaq3Arguments(
                                                  nbrOfItems: nbrOfItems +
                                                      widget
                                                          .chaq2Args.nbrOfItems,
                                                  sommeScore: sommeScore +
                                                      widget.chaq2Args
                                                          .sommeScore),
                                            ),
                                          ));
                                        },
                                        focusColor: cyan2,
                                        hoverColor: cyan2,
                                        splashColor: cyan2,
                                        color: cyan2,
                                        child: Container(
                                          width: 145,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Page suivante',
                                                style: white16Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Icon(
                                                  FontAwesomeIcons
                                                      .arrowAltCircleRight,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : RichText(
                                text: TextSpan(
                                  text: 'Score CHAQ : ',
                                  style: black18Normal,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Dr. ", style: cyan18Bold1_6),
                                    TextSpan(
                                        text:
                                            "${widget.patient.docteur.prenom} ${widget.patient.docteur.nom} ",
                                        style: cyan18Bold1_6),
                                    TextSpan(
                                        text:
                                            ' n\'a rien demandé pour le moment.')
                                  ],
                                ),
                              ),
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
