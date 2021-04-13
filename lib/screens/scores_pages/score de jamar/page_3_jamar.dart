import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_4_jamar.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page3Jamar extends StatefulWidget {
  static const routeName = '/jamar_3';

  @override
  _Page3JamarState createState() => _Page3JamarState();
}

class _Page3JamarState extends State<Page3Jamar> {
  bool testDemanded = true;
  List<String> question_17 = [];
  List<String> question_18 = [];
  List<String> question_19 = [];
  List<String> question_20 = [];
  List<String> question_21 = [];
  List<String> question_22 = [];
  int index_17 = 0;
  int index_18 = 0;
  int index_19 = 0;
  int index_20 = 0;
  int index_21 = 0;
  int index_22 = 0;
  bool doigtsGauches = false;
  bool doigtsDroits = false;
  bool poignetGauche = false;
  bool poignetDroit = false;
  bool coudeGauche = false;
  bool coudeDroit = false;
  bool epauleGauche = false;
  bool epauleDroite = false;
  bool hancheGauche = false;
  bool hancheDroite = false;
  bool genouGauche = false;
  bool genouDroit = false;
  bool chevilleGauche = false;
  bool chevilleDroite = false;
  bool doigtsDePiedGauches = false;
  bool doigtsDePiedDroits = false;
  bool cou = false;
  bool basDeDos = false;
  bool pasDArticulationDouleureuseOuGonflee = false;
  bool sentiEnraidi = false;
  bool fievreSupA38 = false;
  bool eruptionCutanee = false;
  double intensiteDouleur = 0;
  double niveauActiviteMaladie = 0;
  List durees = <String>[
    "15 minutes ou moins",
    "De 15 à 30 minutes",
    "De 30 minutes à 1 heure",
    "De 1 à 2 heures ",
    "Plus de 2 heures",
  ];
  List categories = <String>[
    "Sans aucune difficulté",
    "Avec quelque difficulté",
    "Avec beaucoup de difficuté",
    "Incapable à accomplir",
    "Non applicable",
  ];
  double sommeScore = 0;
  double nbrOfItems = 0;
  List<int> allQuestionsAutresActivites = [];
  void calculEtEnvoiSomme() {
    // allQuestionsAutresActivites
    //     .addAll([index_9, index_10, index_11, index_12, index_13, index_14]);
    // allQuestionsAutresActivites.removeWhere((item) => item == 4);
    // nbrOfItems += allQuestionsAutresActivites.length;

    // sommeScore += allQuestionsAutresActivites.reduce(max);
    // print("nbrOfItems " + nbrOfItems.toString());
    // print("sommeScore " + sommeScore.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: (null),
          icon: Icon(FontAwesomeIcons.fileAlt, color: Colors.white),
          label: Text(
            "Score JAMAR     Page 3/6",
            style: white22Bold,
          ),
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          color: gris1,
          // height: MediaQuery.of(context).size.height,
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: testDemanded
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      questionChaq(
                                          "17. Indiquez si votre enfant ressent aujourd\'hui une douleur ou présente un gonflement dans l\'une des articulations détaillées ci-dessous "),
                                      flatButtonMultipleChoice(
                                          title: 'doigts gauches',
                                          initValue: doigtsGauches,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                doigtsGauches = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'doigts droits',
                                          initValue: doigtsDroits,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                doigtsDroits = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'poignet gauche ',
                                          initValue: poignetGauche,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                poignetGauche = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'poignet droit ',
                                          initValue: poignetDroit,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                poignetDroit = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'coude gauche',
                                          initValue: coudeGauche,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                coudeGauche = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'coude droit',
                                          initValue: coudeDroit,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                coudeDroit = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'epaule gauche',
                                          initValue: epauleGauche,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                epauleGauche = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'epaule droit',
                                          initValue: epauleDroite,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                epauleDroite = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'hanche gauche',
                                          initValue: hancheGauche,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                hancheGauche = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'hanche droite',
                                          initValue: hancheDroite,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                hancheDroite = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'genou gauche',
                                          initValue: genouGauche,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                genouGauche = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'genou droit',
                                          initValue: genouDroit,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                genouDroit = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'cheville gauche',
                                          initValue: chevilleGauche,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                chevilleGauche = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'cheville droite',
                                          initValue: chevilleDroite,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                chevilleDroite = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'doigts de pied gauche',
                                          initValue: doigtsDePiedGauches,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                doigtsDePiedGauches = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'doigts de pied droits',
                                          initValue: doigtsDePiedDroits,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                doigtsDePiedDroits = newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'cou',
                                          initValue: cou,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                cou = newValue;
                                              });
                                            }
                                          }),

                                      flatButtonMultipleChoice(
                                        title:
                                            'mon enfant n\'a pas d\' articulation douleureuse ni gonflée',
                                        initValue:
                                            pasDArticulationDouleureuseOuGonflee,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              pasDArticulationDouleureuseOuGonflee =
                                                  newValue;
                                            });
                                          }
                                        },
                                      ),
                                      questionChaq(
                                          "18. Est ce que votre enfant s\'est-il senti enraidi(e) le matin au réveil dans la semaine qui vient de s\'écouler"),
                                      flatButtonMultipleChoice(
                                          title: 'Non',
                                          initValue: !sentiEnraidi,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                sentiEnraidi = !newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Oui',
                                          initValue: sentiEnraidi,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                sentiEnraidi = newValue;
                                              });
                                            }
                                          }),
                                      sentiEnraidi
                                          ? Column(
                                              children: [
                                                questionChaq(
                                                    "19. Sur quelle durée s\'est-il senti enraidi(e) "),
                                                CheckboxGroup(
                                                  orientation:
                                                      GroupedButtonsOrientation
                                                          .HORIZONTAL,
                                                  labels: durees,
                                                  checked: question_19,
                                                  itemBuilder: (Checkbox cb,
                                                      Text txt, int i) {
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
                                                              child: Text(
                                                                txt.data,
                                                                maxLines: 4,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    black13Normal,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  onChange: (bool isChecked,
                                                      String label,
                                                      int index_19) {
                                                    print(
                                                        "isChecked: $isChecked   label: $label  index: $index_19");
                                                    this.index_19 = index_19;
                                                    if (isChecked == false) {
                                                      this.index_19 = 0;
                                                    }
                                                  },
                                                  onSelected: (List selected) =>
                                                      setState(() {
                                                    if (selected.length > 1) {
                                                      selected.removeAt(0);
                                                      // print('selected length  ${selected.length}');
                                                    }
                                                    print(selected);
                                                    // else {print("only one");}
                                                    question_19 = selected;
                                                  }),
                                                )
                                              ],
                                            )
                                          : SizedBox(height: 0),

                                      questionChaq(
                                          "20. Fièvre plus haute que 38° C (si l\'arthrite en cause)"),
                                      flatButtonMultipleChoice(
                                          title: 'Non',
                                          initValue: !fievreSupA38,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                fievreSupA38 = !newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Oui',
                                          initValue: fievreSupA38,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                fievreSupA38 = newValue;
                                              });
                                            }
                                          }),
                                      questionChaq(
                                          "21. Eruption cutanée (si l\'arthrite en cause)"),
                                      flatButtonMultipleChoice(
                                          title: 'Non',
                                          initValue: !eruptionCutanee,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                eruptionCutanee = !newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Oui',
                                          initValue: eruptionCutanee,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                eruptionCutanee = newValue;
                                              });
                                            }
                                          }),
                                      questionChaq(
                                          "22. En prenant en compte tous les symptômes tel que la douleur, le gonflement des articulations, l\'enraidissement matinal, la fièvre (si elle est en rapport avec l\'arthrite) et l\'éruption cutanée (si elle est en rapport avec l\'arthrite), montrez nous comment vous jugez le niveau d\'activité de la maladie de votre enfant à l\'heure actuelle "),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          sliderLimit(0.0),
                                          Container(
                                            width: 250,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: SliderTheme(
                                                data: SliderTheme.of(context)
                                                    .copyWith(
                                                  activeTrackColor: cyan3,
                                                  inactiveTrackColor: cyan2,
                                                  showValueIndicator:
                                                      ShowValueIndicator.always,
                                                  thumbColor: Colors.blueAccent,
                                                  overlayColor: Colors.purple
                                                      .withAlpha(32),
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
                                                  value: niveauActiviteMaladie,
                                                  min: 0.0,
                                                  max: 10.0,
                                                  divisions: 20,
                                                  label:
                                                      '$niveauActiviteMaladie',
                                                  onChanged: (value) {
                                                    if (mounted == true) {
                                                      setState(
                                                        () {
                                                          niveauActiviteMaladie =
                                                              value;
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          sliderLimit(10.0),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: new FlatButton(
                                            minWidth: 60.0,
                                            onPressed: () {
                                              calculEtEnvoiSomme();
                                              Navigator.of(context).pushNamed(
                                                Page4Jamar.routeName,
                                                // arguments:
                                                // Chaq3Arguments(
                                                //     nbrOfItems: nbrOfItems,
                                                //     sommeScore: sommeScore)
                                              );
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
                                                    padding:
                                                        const EdgeInsets.only(
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
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       bottom: 10.0, top: 10.0),
                                      //   child: Text(
                                      //     "Combien de fois text test test?",
                                      //     style: cyan20Bold,
                                      //   ),
                                      // ),
                                      // flatButtonMultipleChoice(
                                      //     title: 'test',
                                      //     initValue: isChecked1,
                                      //     onChanged: (newValue) {
                                      //       if (this.mounted) {
                                      //         setState(() {
                                      //           isChecked1 = newValue;
                                      //         });
                                      //       }
                                      //     }),
                                      // flatButtonMultipleChoice(
                                      //     title: 'test',
                                      //     initValue: isChecked2,
                                      //     onChanged: (newValue) {
                                      //       if (this.mounted) {
                                      //         setState(() {
                                      //           isChecked2 = newValue;
                                      //         });
                                      //       }
                                      //     }),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       bottom: 10.0, top: 10.0),
                                      //   child: Text(
                                      //     "Combien de fois text test test?",
                                      //     style: cyan20Bold,
                                      //   ),
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //       bottom: 10.0,
                                      //       top: 15.0,
                                      //       right: 20.0,
                                      //       left: 20.0),
                                      //   padding: EdgeInsets.only(
                                      //       right: 10.0, left: 10.0),
                                      //   decoration: BoxDecoration(
                                      //     border: Border.all(
                                      //         color: cyan2, width: 2.0),
                                      //     borderRadius: BorderRadius.all(
                                      //         Radius.circular(8)),
                                      //   ),
                                      //   child: TextFormField(
                                      //       cursorColor: cyan2,
                                      //       decoration: InputDecoration(
                                      //           border: InputBorder.none),
                                      //       style: black18Normal),
                                      // ),
                                    ],
                                  )
                                : RichText(
                                    text: TextSpan(
                                      text: 'Score CHAQ ',
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
