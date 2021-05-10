import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/models/chaq_arguments.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class Page4Chaq extends StatefulWidget {
  Patient patient;
  String token;
  Chaq3Arguments chaq3Args;
  Page4Chaq({this.patient, this.token, this.chaq3Args});
  @override
  _Page4ChaqState createState() => _Page4ChaqState();
}

class _Page4ChaqState extends State<Page4Chaq> {
  bool testDemanded = true;
  ScrollController scrollController = ScrollController();
  List<String> question_28 = [];
  List<String> question_29 = [];
  List<String> question_30 = [];
  List<String> question_31 = [];
  List<String> question_32 = [];
  List<String> question_33 = [];

  int index_28 = 0;
  int index_29 = 0;
  int index_30 = 0;
  int index_31 = 0;
  int index_32 = 0;
  int index_33 = 0;
  double severiteDouleur = 0;
  double evaluationGlobale = 0;
  bool siegeToiletteRehausse = false;
  bool siegeBaignoire = false;
  bool ouvrePot = false;
  bool barreDAppuiDeBaignoire = false;
  bool instrumentsAlongManchePourAtteindreLesObjets = false;
  bool instrumentsAlongManchePourAtteindreLaToilette = false;
  List typesAide = <String>[
    "Hygiène",
    "Atteindre",
    "Saisir, tenir",
    "Autres activités",
  ];
  List categories = <String>[
    "Sans difficulté",
    "Avec quelque difficulté",
    "Avec beaucoup de difficuté",
    "Incapable de le faire",
    'Question inadaptée pour l\'âge',
  ];
  double sommeScore = 0;
  double nbrOfItems = 0;
  double nbrOfItemsTotal = 0;
  double sommeScoreTotal = 0;
  List<int> allQuestionsAutresActivites = [];
  void calculEtEnvoiSomme() async {
    allQuestionsAutresActivites
        .addAll([index_28, index_29, index_30, index_31, index_32]);
    allQuestionsAutresActivites.removeWhere((item) => item == 4);
    nbrOfItems += allQuestionsAutresActivites.length;
    sommeScore += allQuestionsAutresActivites.reduce(max);
    nbrOfItemsTotal = nbrOfItems + widget.chaq3Args.nbrOfItems;
    sommeScoreTotal = sommeScore + widget.chaq3Args.sommeScore;

    double scoreFinal = num.parse((sommeScoreTotal).toStringAsFixed(2));
    String scoreFinalString = scoreFinal.toString() + " / 24 (8 catégories)";
    String douleurFinalString = severiteDouleur.toString() + " / 100";
    String evaluationFinalString = evaluationGlobale.toString() + " / 100";

    String fillChaqURL =
        'http://192.168.1.16:4000/patients/${widget.patient.id.toString()}/fillChaq';
    try {
      var fillChaqResponse = await http.post("$fillChaqURL",
          body: json.encode({
            "score": scoreFinalString,
            "douleurs": douleurFinalString,
            "evaluation": evaluationFinalString
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${widget.token}'
          });
      if (fillChaqResponse.statusCode == 200 ||
          fillChaqResponse.statusCode == 201 ||
          fillChaqResponse.statusCode == 202 ||
          fillChaqResponse.statusCode == 203) {
        await enregistrerAvecSuccess(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePatient(
            patient: widget.patient,
            token: widget.token,
          ),
        ));
      } else {
        erreurEnregistrement(context);
        Future.delayed(Duration(milliseconds: 1000), () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePatient(
              patient: widget.patient,
              token: widget.token,
            ),
          ));
        });
      }
    } catch (e) {
      print(e.toString());
    }
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
            "Score CHAQ   Page 4/4",
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
                                      "Autres activités".toUpperCase(),
                                      style: cyan20Bold,
                                    ),
                                  ),
                                  questionChaq(
                                      "Votre enfant est-il capable de"),
                                  questionChaq(
                                      "1. Aller chercher le pain, faire des comissions ou des courses  ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_28,
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
                                        int index_28) {
                                      this.index_28 = index_28;
                                      if (isChecked == false) {
                                        this.index_28 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_28 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "2. Monter dans une voiture ou un bus et en descendre ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_29,
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
                                        int index_29) {
                                      this.index_29 = index_29;
                                      if (isChecked == false) {
                                        this.index_29 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_29 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "3. Faire du vélo ou du tricycle ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_30,
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
                                        int index_30) {
                                      this.index_30 = index_30;
                                      if (isChecked == false) {
                                        this.index_30 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_30 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "4. Aider à la maison (par ex. faire la vaisselle, sortir la poubelle, pousser l\'aspirateur,  mettre la table, faire son lit, ranger sa chambre ) ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_31,
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
                                        int index_31) {
                                      this.index_31 = index_31;
                                      if (isChecked == false) {
                                        this.index_31 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_31 = selected;
                                    }),
                                  ),
                                  questionChaq("5. Courir et jouer ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_32,
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
                                        int index_32) {
                                      this.index_32 = index_32;
                                      if (isChecked == false) {
                                        this.index_32 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_32 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "6. Veuillez indiquer d\'une croix si votre enfant utilise habituellement un des ces appareils ou accessoires pour effectuer ces activités ?"),
                                  flatButtonMultipleChoice(
                                      title: 'siège de toilette rehaussé',
                                      initValue: siegeToiletteRehausse,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            siegeToiletteRehausse = newValue;
                                            if (siegeToiletteRehausse == true) {
                                              ouvrePot = !newValue;
                                              siegeBaignoire = !newValue;
                                              barreDAppuiDeBaignoire =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLesObjets =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLaToilette =
                                                  !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title: 'siège de baignoire',
                                      initValue: siegeBaignoire,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            siegeBaignoire = newValue;
                                            if (siegeBaignoire == true) {
                                              ouvrePot = !newValue;
                                              siegeToiletteRehausse = !newValue;
                                              barreDAppuiDeBaignoire =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLesObjets =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLaToilette =
                                                  !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title:
                                          'ouvre pot (pour les pots déja ouverts)',
                                      initValue: ouvrePot,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            ouvrePot = newValue;
                                            if (ouvrePot == true) {
                                              siegeBaignoire = !newValue;
                                              siegeToiletteRehausse = !newValue;
                                              barreDAppuiDeBaignoire =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLesObjets =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLaToilette =
                                                  !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title: 'barre d\'appui de baignoire ',
                                      initValue: barreDAppuiDeBaignoire,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            barreDAppuiDeBaignoire = newValue;
                                            if (barreDAppuiDeBaignoire ==
                                                true) {
                                              siegeBaignoire = !newValue;
                                              siegeToiletteRehausse = !newValue;
                                              ouvrePot = !newValue;
                                              instrumentsAlongManchePourAtteindreLesObjets =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLaToilette =
                                                  !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title:
                                          'instruments à long manche pour atteindre les objets',
                                      initValue:
                                          instrumentsAlongManchePourAtteindreLesObjets,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            instrumentsAlongManchePourAtteindreLesObjets =
                                                newValue;
                                            if (instrumentsAlongManchePourAtteindreLesObjets ==
                                                true) {
                                              siegeBaignoire = !newValue;
                                              siegeToiletteRehausse = !newValue;
                                              ouvrePot = !newValue;
                                              barreDAppuiDeBaignoire =
                                                  !newValue;
                                              instrumentsAlongManchePourAtteindreLaToilette =
                                                  !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title:
                                          'instruments à long manche pour atteindre la toilette ',
                                      initValue:
                                          instrumentsAlongManchePourAtteindreLaToilette,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            instrumentsAlongManchePourAtteindreLaToilette =
                                                newValue;
                                            if (instrumentsAlongManchePourAtteindreLaToilette ==
                                                true) {
                                              siegeBaignoire = !newValue;
                                              siegeToiletteRehausse = !newValue;
                                              ouvrePot = !newValue;
                                              instrumentsAlongManchePourAtteindreLesObjets =
                                                  !newValue;
                                              barreDAppuiDeBaignoire =
                                                  !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  questionChaq(
                                      "7. Veuillez indiquer d\'une croix les activités pour lesquelles votre enfant a besoin de l'aide de quelqu\'un à cause de la maladie ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: typesAide,
                                    checked: question_33,
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
                                                child: Text(
                                                  txt.data,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: black14Normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_33) {
                                      this.index_33 = index_33;
                                      if (isChecked == false) {
                                        this.index_33 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_33 = selected;
                                    }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 10.0),
                                    child: Text(
                                      "Douleur".toUpperCase(),
                                      style: cyan20Bold,
                                    ),
                                  ),
                                  questionChaq(
                                      "Nous souhaitons également savoir si votre enfant a eu des douleurs A CAUSE DE LA MALADIE "),
                                  questionChaq(
                                      "Quelle a été l\'importance de ses douleurs AU COURS DES HUITS DERNIERS JOURS "),
                                  questionChaq(
                                      "Veuillez indiquer la sévérité des douleurs "),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(
                                          flex: 1,
                                          child: sliderLimitWithText(
                                              0.0, "Aucune Douleur")),
                                      Flexible(
                                        flex: 4,
                                        child: Container(
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
                                                value: severiteDouleur,
                                                min: 0.0,
                                                max: 100.0,
                                                divisions: 10,
                                                label:
                                                    '${severiteDouleur.round()}',
                                                onChanged: (value) {
                                                  if (mounted == true) {
                                                    setState(
                                                      () {
                                                        severiteDouleur = value;
                                                      },
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: sliderLimitWithText(
                                            100.0, "Douleurs extrèmes"),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 10.0),
                                    child: Text(
                                      "Evaluation globale".toUpperCase(),
                                      style: cyan20Bold,
                                    ),
                                  ),
                                  questionChaq(
                                      "En considérant toutes les répercussions que la maladie a sur votre enfant, indiquez comment \" il se débrouille \""),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(
                                          flex: 1,
                                          child: sliderLimitWithText(
                                              0.0, "Très bien")),
                                      Flexible(
                                        flex: 5,
                                        child: Container(
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
                                                value: evaluationGlobale,
                                                min: 0.0,
                                                max: 100.0,
                                                divisions: 10,
                                                label:
                                                    '${evaluationGlobale.round()}',
                                                onChanged: (value) {
                                                  if (mounted == true) {
                                                    setState(
                                                      () {
                                                        evaluationGlobale =
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
                                      Flexible(
                                          flex: 1,
                                          child: sliderLimitWithText(
                                              100.0, "Très mal")),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: new FlatButton(
                                        minWidth: 60.0,
                                        onPressed: () {
                                          calculEtEnvoiSomme();
                                        },
                                        focusColor: cyan2,
                                        hoverColor: cyan2,
                                        splashColor: cyan2,
                                        color: cyan2,
                                        child: Container(
                                          width: 126,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                'Enregistrer',
                                                style: white16Bold,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Icon(
                                                  Icons.save,
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
                                            "${widget.patient.docteur.prenom} ${widget.patient.docteur.nom}",
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
