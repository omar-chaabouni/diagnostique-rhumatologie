import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/models/jamar_arguments.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_2_jamar.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page1Jamar extends StatefulWidget {
  static const routeName = '/jamar_1';
  Patient patient;
  String token;
  Page1Jamar({this.patient, this.token});
  @override
  _Page1JamarState createState() => _Page1JamarState();
}

class _Page1JamarState extends State<Page1Jamar> {
  bool testDemanded = true;
  List<String> question_1 = [];
  List<String> question_2 = [];
  List<String> question_3 = [];
  List<String> question_4 = [];
  List<String> question_5 = [];
  List<String> question_6 = [];
  List<String> question_7 = [];
  List<String> question_8 = [];
  int index_1 = 0;
  int index_2 = 0;
  int index_3 = 0;
  int index_4 = 0;
  int index_5 = 0;
  int index_6 = 0;
  int index_7 = 0;
  int index_8 = 0;
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
    allQuestionsAutresActivites
        .addAll([index_1, index_2, index_3, index_4, index_5, index_6]);
    allQuestionsAutresActivites.removeWhere((item) => item == 4);
    nbrOfItems += allQuestionsAutresActivites.length;

    sommeScore += allQuestionsAutresActivites.reduce(max);
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
          icon: Icon(FontAwesomeIcons.fileAlt, color: Colors.white),
          label: Text(
            "Score JAMAR     Page 1/6",
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0, top: 10.0),
                                        child: Text(
                                          "Choisissez la réponse qui décrit le mieux la capacité de votre enfant à accomplir à bien les activités énumérés ci dessous au cours des quatres dernières semaines",
                                          style: cyan20Bold,
                                        ),
                                      ),
                                      questionChaq(
                                          "1. Courir une distance d\'au moins 10 mètres sur le plat "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_1,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
                                          if (selected.length > 1) {
                                            selected.removeAt(0);
                                            // print('selected length  ${selected.length}');
                                          }
                                          print(selected);
                                          // else {print("only one");}
                                          question_1 = selected;
                                        }),
                                      ),

                                      questionChaq("2. Monter 5 marches "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_2,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
                                          if (selected.length > 1) {
                                            selected.removeAt(0);
                                            // print('selected length  ${selected.length}');
                                          }
                                          print(selected);
                                          // else {print("only one");}
                                          question_2 = selected;
                                        }),
                                      ),
                                      questionChaq("3. Sauter en avant "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_3,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
                                          if (selected.length > 1) {
                                            selected.removeAt(0);
                                            // print('selected length  ${selected.length}');
                                          }
                                          print(selected);
                                          // else {print("only one");}
                                          question_3 = selected;
                                        }),
                                      ),
                                      questionChaq("4. S\'accroupir "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_4,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
                                          if (selected.length > 1) {
                                            selected.removeAt(0);
                                            // print('selected length  ${selected.length}');
                                          }
                                          print(selected);
                                          // else {print("only one");}
                                          question_4 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "5. Se pencher pour ramasser un objet par terre "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_5,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
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
                                          "6. Faire des activités qui implique l\'usage de ses doights "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_6,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
                                          if (selected.length > 1) {
                                            selected.removeAt(0);
                                            // print('selected length  ${selected.length}');
                                          }
                                          print(selected);
                                          // else {print("only one");}
                                          question_6 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "7. Serrer et desserer ses poignets "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_7,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
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
                                          "8. Serrer un objet avec ses mains "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_8,
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
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: black13Normal,
                                                    ),
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
                                        onSelected: (List selected) =>
                                            setState(() {
                                          if (selected.length > 1) {
                                            selected.removeAt(0);
                                            // print('selected length  ${selected.length}');
                                          }
                                          print(selected);
                                          // else {print("only one");}
                                          question_8 = selected;
                                        }),
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
                                                  Page2Jamar.routeName,
                                                  arguments: Jamar1Arguments(
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
