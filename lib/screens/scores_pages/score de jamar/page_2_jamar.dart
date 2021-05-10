import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page2Jamar extends StatefulWidget {
  static const routeName = '/jamar_2';

  @override
  _Page2JamarState createState() => _Page2JamarState();
}

class _Page2JamarState extends State<Page2Jamar> {
  bool testDemanded = true;
  List<String> question_9 = [];
  List<String> question_10 = [];
  List<String> question_11 = [];
  List<String> question_12 = [];
  List<String> question_13 = [];
  List<String> question_14 = [];
  List<String> question_15 = [];
  int index_9 = 0;
  int index_10 = 0;
  int index_11 = 0;
  int index_12 = 0;
  int index_13 = 0;
  int index_14 = 0;
  int index_15 = 0;
  double intensiteDouleur = 0;
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
        .addAll([index_9, index_10, index_11, index_12, index_13, index_14]);
    allQuestionsAutresActivites.removeWhere((item) => item == 4);
    nbrOfItems += allQuestionsAutresActivites.length;

    sommeScore += allQuestionsAutresActivites.reduce(max);
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
            "Score JAMAR     Page 2/6",
            style: white22Bold,
          ),
        ),
      ),
      body: new SingleChildScrollView(
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
                                          "9. Ouvrir une porte en abaissant la poignée "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_9,
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
                                            int index_9) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_9");
                                          this.index_9 = index_9;
                                          if (isChecked == false) {
                                            this.index_9 = 0;
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
                                          question_9 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "10. Ouvrir et fermer un robinet ou ouvrir un bocal qui a déja été ouvert "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
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
                                            int index_10) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_10");
                                          this.index_10 = index_10;
                                          if (isChecked == false) {
                                            this.index_10 = 0;
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
                                          question_10 = selected;
                                        }),
                                      ),
                                      questionChaq("11. Etendre ses bras "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
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
                                            int index_11) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_11");
                                          this.index_11 = index_11;
                                          if (isChecked == false) {
                                            this.index_11 = 0;
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
                                          question_11 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "12. Mettre ses mains derrière la nuque "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_12,
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
                                            int index_12) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_12");
                                          this.index_12 = index_12;
                                          if (isChecked == false) {
                                            this.index_12 = 0;
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
                                          question_12 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "13. Tourner sa tête et regarder par-dessus ses épaules"),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
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
                                            int index_13) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_13");
                                          this.index_13 = index_13;
                                          if (isChecked == false) {
                                            this.index_13 = 0;
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
                                          question_13 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "14. Etendre son cou pour regarder le plafond "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
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
                                            int index_14) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_14");
                                          this.index_14 = index_14;
                                          if (isChecked == false) {
                                            this.index_14 = 0;
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
                                          question_14 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "15. Croquer un sandwitch ou une pomme "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
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
                                            int index_15) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_15");
                                          this.index_15 = index_15;
                                          if (isChecked == false) {
                                            this.index_15 = 0;
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
                                          question_15 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "16. Quelle est l\'intensité de la douleur ressentie par votre enfant à cause de sa maladie dans la semaine qui vient de s\'écouler ? "),
                                      SizedBox(
                                        height: 12.0,
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
                                                  value: intensiteDouleur,
                                                  min: 0.0,
                                                  max: 10.0,
                                                  divisions: 20,
                                                  label: '$intensiteDouleur',
                                                  onChanged: (value) {
                                                    if (mounted == true) {
                                                      setState(
                                                        () {
                                                          intensiteDouleur =
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
                                              // Navigator.of(context).pushNamed(
                                              //   Page3Jamar.routeName,
                                              //   // arguments: Chaq3Arguments(
                                              //   //     nbrOfItems: nbrOfItems,
                                              //   //     sommeScore: sommeScore)
                                              // );
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
                                            text: "", style: cyan18Bold1_6),
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
