import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/models/chaq_arguments.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_2_chaq.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page1Chaq extends StatefulWidget {
  static const routeName = '/chaq_1';
  Patient patient;
  String token;
  Page1Chaq({this.patient, this.token});
  @override
  _Page1ChaqState createState() => _Page1ChaqState();
}

class _Page1ChaqState extends State<Page1Chaq> {
  bool testDemanded = true;
  List<String> question_1 = [];
  List<String> question_2 = [];
  List<String> question_3 = [];
  List<String> question_4 = [];
  List<String> question_5 = [];
  List<String> question_6 = [];
  List<String> question_7 = [];
  List<String> question_8 = [];
  List<String> question_9 = [];
  int index_1 = 0;
  int index_2 = 0;
  int index_3 = 0;
  int index_4 = 0;
  int index_5 = 0;
  int index_6 = 0;
  int index_7 = 0;
  int index_8 = 0;
  int index_9 = 0;
  List categories = <String>[
    "Sans difficulté",
    "Avec quelque difficulté",
    "Avec beaucoup de difficuté",
    "Incapable de le faire",
    'Question inadaptée pour l\'âge',
  ];
  double sommeScore = 0;
  double nbrOfItems = 0;
  List<int> allQuestionsHabillerSepreparer = [];
  List<int> allQuestionsManger = [];
  List<int> allQuestionsSeLever = [];

  void calculEtEnvoiSomme() {
    allQuestionsHabillerSepreparer.addAll([index_1, index_2, index_3, index_4]);
    allQuestionsSeLever.addAll([index_5, index_6]);
    allQuestionsManger.addAll([index_7, index_8, index_9]);
    allQuestionsHabillerSepreparer.removeWhere((item) => item == 4);
    allQuestionsSeLever.removeWhere((item) => item == 4);
    allQuestionsManger.removeWhere((item) => item == 4);
    nbrOfItems += allQuestionsHabillerSepreparer.length +
        allQuestionsSeLever.length +
        allQuestionsManger.length;
    sommeScore += allQuestionsHabillerSepreparer.reduce(max);
    sommeScore += allQuestionsSeLever.reduce(max);
    sommeScore += allQuestionsManger.reduce(max);
    print("nbrOfItems " + nbrOfItems.toString());
    print("sommeScore " + sommeScore.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: (null),
          icon: Icon(FontAwesomeIcons.fileAlt, color: Colors.white, size: 20.0),
          label: Text(
            "Score CHAQ   Page 1/4",
            style: white20Bold,
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
                      child: testDemanded
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10.0),
                                  child: Text(
                                    "S\'habiller et se préparer ".toUpperCase(),
                                    style: cyan20Bold,
                                  ),
                                ),
                                questionChaq("Votre enfant est-il capable de"),
                                questionChaq(
                                    "1. S\'habiller, y compris nouer ces lacets et boutonner ses vêtements ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_1,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_1) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_1");
                                    this.index_1 = index_1;
                                    if (isChecked == false) {
                                      this.index_1 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_1 = selected;
                                  }),
                                ),
                                questionChaq("2. Se laver les chevaux ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_2,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_2) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_2");
                                    this.index_2 = index_2;
                                    if (isChecked == false) {
                                      this.index_2 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_2 = selected;
                                  }),
                                ),
                                questionChaq("3. Enlever ses chaussettes ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_3,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_3) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_3");
                                    this.index_3 = index_3;
                                    if (isChecked == false) {
                                      this.index_3 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_3 = selected;
                                  }),
                                ),
                                questionChaq("4. Se couper les ongles ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_4,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_4) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_4");
                                    this.index_4 = index_4;
                                    if (isChecked == false) {
                                      this.index_4 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_4 = selected;
                                  }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10.0),
                                  child: Text(
                                    "Se lever ".toUpperCase(),
                                    style: cyan20Bold,
                                  ),
                                ),
                                questionChaq("Votre enfant est-il capable de"),
                                questionChaq(
                                    "1. Se lever d\'une chaise basse ou du sol ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_5,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_5) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_5");
                                    this.index_5 = index_5;
                                    if (isChecked == false) {
                                      this.index_5 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_5 = selected;
                                  }),
                                ),
                                questionChaq(
                                    "2. Se mettre au lit et en sortir ou se mettre debout dans son lit ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_6,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_6) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_6");
                                    this.index_6 = index_6;
                                    if (isChecked == false) {
                                      this.index_6 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_6 = selected;
                                  }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, top: 10.0),
                                  child: Text(
                                    "Manger ".toUpperCase(),
                                    style: cyan20Bold,
                                  ),
                                ),
                                questionChaq("Votre enfant est-il capable de"),
                                questionChaq("1. Couper sa viande ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_7,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_7) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_7");
                                    this.index_7 = index_7;
                                    if (isChecked == false) {
                                      this.index_7 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_7 = selected;
                                  }),
                                ),
                                questionChaq(
                                    "2. Porter une tasse ou un verre à la bouche ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_8,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_8) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_8");
                                    this.index_8 = index_8;
                                    if (isChecked == false) {
                                      this.index_8 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_8 = selected;
                                  }),
                                ),
                                questionChaq("3. Ouvrir un pot de yaourt ?"),
                                CheckboxGroup(
                                  orientation:
                                      GroupedButtonsOrientation.HORIZONTAL,
                                  labels: categories,
                                  checked: question_9,
                                  itemBuilder: (Checkbox cb, Text txt, int i) {
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
                                      int index_9) {
                                    print(
                                        "isChecked: $isChecked   label: $label  index: $index_9");
                                    this.index_9 = index_9;
                                    if (isChecked == false) {
                                      this.index_9 = 0;
                                    }
                                  },
                                  onSelected: (List selected) => setState(() {
                                    if (selected.length > 1) {
                                      selected.removeAt(0);
                                      // print('selected length  ${selected.length}');
                                    }
                                    print(selected);
                                    // else {print("only one");}
                                    question_9 = selected;
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
                                        Navigator.of(context).pushNamed(
                                            Page2Chaq.routeName,
                                            arguments: Chaq1Arguments(
                                                nbrOfItems: nbrOfItems,
                                                sommeScore: sommeScore));
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
                                //   padding:
                                //       EdgeInsets.only(right: 10.0, left: 10.0),
                                //   decoration: BoxDecoration(
                                //     border:
                                //         Border.all(color: cyan2, width: 2.0),
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(8)),
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
                                text: 'Score CHAQ : ',
                                style: black18Normal,
                                children: <TextSpan>[
                                  TextSpan(text: "Dr. ", style: cyan18Bold1_6),
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
    );
  }
}
