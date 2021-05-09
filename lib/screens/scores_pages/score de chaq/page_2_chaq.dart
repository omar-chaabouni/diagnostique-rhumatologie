import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/models/chaq_arguments.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_3_chaq.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'dart:math';

// ignore: must_be_immutable
class Page2Chaq extends StatefulWidget {
  Patient patient;
  String token;
  Chaq1Arguments chaq1Args;
  Page2Chaq({this.patient, this.token, this.chaq1Args});
  @override
  _Page2ChaqState createState() => _Page2ChaqState();
}

class _Page2ChaqState extends State<Page2Chaq> {
  bool testDemanded = true;
  ScrollController scrollController = ScrollController();
  List<String> question_10 = [];
  List<String> question_11 = [];
  List<String> question_12 = []; // 8 checkboxes question
  List<String> question_13 = [];
  List<String> question_14 = [];
  List<String> question_15 = [];
  List<String> question_16 = [];
  List<String> question_17 = [];
  List<String> question_18 = [];

  int index_10 = 0;
  int index_11 = 0;
  int index_12 = 0;
  int index_13 = 0;
  int index_14 = 0;
  int index_15 = 0;
  int index_16 = 0;
  int index_17 = 0;
  int index_18 = 0;

  bool canne = false;
  bool deambulateur = false;
  bool bequilles = false;
  bool fauteuilRoulant = false;
  bool accessoiresPourShabiller = false;
  bool grosCrayons = false;
  bool siegeSpecialementAdapte = false;
  bool autre = false;

  List typesAide = <String>[
    "S\'habiller et se préparer",
    "Se lever",
    "Manger",
    "Marcher",
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
  List<int> allQuestionsMarcher = [];
  List<int> allQuestionsHygiene = [];

  @override
  void initState() {
    super.initState();
  }

  void calculEtEnvoiSomme() {
    allQuestionsMarcher.addAll([
      index_10,
      index_11,
    ]);
    allQuestionsHygiene.addAll([index_14, index_15, index_17, index_18]);
    allQuestionsMarcher.removeWhere((item) => item == 4);
    allQuestionsHygiene.removeWhere((item) => item == 4);

    nbrOfItems += allQuestionsMarcher.length + allQuestionsHygiene.length;
    sommeScore += allQuestionsMarcher.reduce(max);
    sommeScore += allQuestionsHygiene.reduce(max);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
            "Score CHAQ   Page 2/4",
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
                                      "Marcher ".toUpperCase(),
                                      style: cyan20Bold,
                                    ),
                                  ),
                                  questionChaq(
                                      "Votre enfant est-il capable de"),
                                  questionChaq(
                                      "1. Marcher dehors sur terrain plat ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_10,
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
                                        int index_10) {
                                      this.index_10 = index_10;
                                      if (isChecked == false) {
                                        this.index_10 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_10 = selected;
                                    }),
                                  ),
                                  questionChaq("2. Monter quelques marches ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_11,
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
                                        int index_11) {
                                      this.index_11 = index_11;
                                      if (isChecked == false) {
                                        this.index_11 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_11 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "3. Veuillez indiquer d\'une croix si votre enfant utilise habituellement un des ces appareils ou accessoires pour effectuer ces activités ?"),
                                  flatButtonMultipleChoice(
                                      title: 'canne',
                                      initValue: canne,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            canne = newValue;
                                            if (canne == true) {
                                              fauteuilRoulant = !newValue;
                                              bequilles = !newValue;
                                              deambulateur = !newValue;
                                              accessoiresPourShabiller =
                                                  !newValue;
                                              grosCrayons = !newValue;
                                              siegeSpecialementAdapte =
                                                  !newValue;
                                              autre = !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title: 'déambulateur',
                                      initValue: deambulateur,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            deambulateur = newValue;
                                            if (deambulateur == true) {
                                              fauteuilRoulant = !newValue;
                                              bequilles = !newValue;
                                              canne = !newValue;
                                              accessoiresPourShabiller =
                                                  !newValue;
                                              grosCrayons = !newValue;
                                              siegeSpecialementAdapte =
                                                  !newValue;
                                              autre = !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title: 'béquilles',
                                      initValue: bequilles,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            bequilles = newValue;
                                            if (bequilles == true) {
                                              fauteuilRoulant = !newValue;
                                              deambulateur = !newValue;
                                              canne = !newValue;
                                              accessoiresPourShabiller =
                                                  !newValue;
                                              grosCrayons = !newValue;
                                              siegeSpecialementAdapte =
                                                  !newValue;
                                              autre = !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title: 'fauteuil roulant',
                                      initValue: fauteuilRoulant,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            fauteuilRoulant = newValue;
                                            if (fauteuilRoulant == true) {
                                              bequilles = !newValue;
                                              deambulateur = !newValue;
                                              canne = !newValue;
                                              accessoiresPourShabiller =
                                                  !newValue;
                                              grosCrayons = !newValue;
                                              siegeSpecialementAdapte =
                                                  !newValue;
                                              autre = !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title:
                                          'accessoires pour s\'habiller (crochet enfile bouton, anneau pour fermeture éclair, chausse pied à long manches ... ',
                                      initValue: accessoiresPourShabiller,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            accessoiresPourShabiller = newValue;
                                            if (accessoiresPourShabiller ==
                                                true) {
                                              bequilles = !newValue;
                                              deambulateur = !newValue;
                                              canne = !newValue;
                                              fauteuilRoulant = !newValue;
                                              grosCrayons = !newValue;
                                              siegeSpecialementAdapte =
                                                  !newValue;
                                              autre = !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title:
                                          'gros crayons ou autres objects spécialement adaptés ',
                                      initValue: grosCrayons,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            grosCrayons = newValue;
                                            if (grosCrayons == true) {
                                              bequilles = !newValue;
                                              deambulateur = !newValue;
                                              canne = !newValue;
                                              fauteuilRoulant = !newValue;
                                              accessoiresPourShabiller =
                                                  !newValue;
                                              siegeSpecialementAdapte =
                                                  !newValue;
                                              autre = !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title: 'siège spécialement_adapté ',
                                      initValue: siegeSpecialementAdapte,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            siegeSpecialementAdapte = newValue;
                                            if (siegeSpecialementAdapte ==
                                                true) {
                                              bequilles = !newValue;
                                              deambulateur = !newValue;
                                              canne = !newValue;
                                              fauteuilRoulant = !newValue;
                                              grosCrayons = !newValue;
                                              accessoiresPourShabiller =
                                                  !newValue;
                                              autre = !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  flatButtonMultipleChoice(
                                      title: 'autres ..',
                                      initValue: autre,
                                      onChanged: (newValue) {
                                        if (this.mounted) {
                                          setState(() {
                                            autre = newValue;
                                            if (autre == true) {
                                              bequilles = !newValue;
                                              deambulateur = !newValue;
                                              canne = !newValue;
                                              fauteuilRoulant = !newValue;
                                              grosCrayons = !newValue;
                                              siegeSpecialementAdapte =
                                                  !newValue;
                                              accessoiresPourShabiller =
                                                  !newValue;
                                            }
                                          });
                                        }
                                      }),
                                  questionChaq(
                                      "4. Veuillez indiquer d\'une croix les activités pour lesquelles votre enfant a besoin de l'aide de quelqu\'un à cause de la maladie ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: typesAide,
                                    checked: question_13,
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
                                                  style: GoogleFonts.oxygen(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    onChange: (bool isChecked, String label,
                                        int index_13) {
                                      this.index_13 = index_13;
                                      if (isChecked == false) {
                                        this.index_13 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_13 = selected;
                                    }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 10.0),
                                    child: Text(
                                      "Hygiène".toUpperCase(),
                                      style: cyan20Bold,
                                    ),
                                  ),
                                  questionChaq(
                                      "Votre enfant est-il capable de"),
                                  questionChaq(
                                      "1. Se laver et se sécher complètement ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_14,
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
                                        int index_14) {
                                      this.index_14 = index_14;
                                      if (isChecked == false) {
                                        this.index_14 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_14 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "2. Prendre un bain (entre dans la baignoire et en sortir) ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_15,
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
                                        int index_15) {
                                      this.index_15 = index_15;
                                      if (isChecked == false) {
                                        this.index_15 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_15 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "3. S\'asseoir et se relever des toilettes ou du pot ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_16,
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
                                        int index_16) {
                                      this.index_16 = index_16;
                                      if (isChecked == false) {
                                        this.index_16 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_16 = selected;
                                    }),
                                  ),
                                  questionChaq("4. Se brosser les dents ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_17,
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
                                        int index_17) {
                                      this.index_17 = index_17;
                                      if (isChecked == false) {
                                        this.index_17 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_17 = selected;
                                    }),
                                  ),
                                  questionChaq(
                                      "5. Se peigner, se brosser les cheveux ?"),
                                  CheckboxGroup(
                                    orientation:
                                        GroupedButtonsOrientation.HORIZONTAL,
                                    labels: categories,
                                    checked: question_18,
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
                                        int index_18) {
                                      this.index_18 = index_18;
                                      if (isChecked == false) {
                                        this.index_18 = 0;
                                      }
                                    },
                                    onSelected: (List selected) => setState(() {
                                      if (selected.length > 1) {
                                        selected.removeAt(0);
                                      }
                                      question_18 = selected;
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
                                            builder: (context) => Page3Chaq(
                                              patient: widget.patient,
                                              token: widget.token,
                                              chaq2Args: Chaq2Arguments(
                                                  nbrOfItems: nbrOfItems +
                                                      widget
                                                          .chaq1Args.nbrOfItems,
                                                  sommeScore: sommeScore +
                                                      widget.chaq1Args
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
