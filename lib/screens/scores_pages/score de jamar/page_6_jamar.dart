import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page6Jamar extends StatefulWidget {
  static const routeName = '/jamar_6';

  @override
  _Page6JamarState createState() => _Page6JamarState();
}

class _Page6JamarState extends State<Page6Jamar> {
  bool testDemanded = true;
  var controllerMedicament = TextEditingController();
  var controllerNePrendPadDeMedicament = TextEditingController();
  var controllerMedicamentDifficileAAdministrerRegulierement =
      TextEditingController();
  var controllerDifficultesMilieuScolaire = TextEditingController();

  List<String> question_33 = [];
  List<String> question_34 = [];
  List<String> question_35 = [];
  List<String> question_36 = [];
  List<String> question_37 = [];
  List<String> question_38 = [];
  List<String> question_39 = [];
  List<String> question_40 = [];
  List<String> question_41 = [];
  List<String> question_42 = [];

  int index_33 = 0;
  int index_34 = 0;
  int index_35 = 0;
  int index_36 = 0;
  int index_37 = 0;
  int index_38 = 0;
  int index_39 = 0;
  int index_40 = 0;
  int index_41 = 0;
  int index_42 = 0;

  List categories = <String>[
    "Jamais",
    "Parfois",
    "Souvent",
    "Tous les jours",
    "Non applicable",
  ];
  double commentSeSentEnfant = 0;
  bool accordSituationEnfantResteStable = false;
  double sommeScore = 0;
  double nbrOfItems = 0;
  List<int> allQuestionsAutresActivites = [];
  void calculEtEnvoiSomme() {
    var contenuControllerMedicament = controllerMedicament.text;
    var contenuControllerNePrendPadDeMedicament =
        controllerNePrendPadDeMedicament.text;
    var contenuControllerMedicamentDifficileAAdministrerRegulierement =
        controllerMedicamentDifficileAAdministrerRegulierement.text;
    var contenuControllerDifficultesMilieuScolaire =
        controllerDifficultesMilieuScolaire.text;

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
            "Score JAMAR     Page 6/6",
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
                                          "33. A eu des difficultés à prendre soin de lui même, par exemple pour manger, pour se laver ou s\'habiller"),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
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
                                            int index_33) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_33");
                                          this.index_33 = index_33;
                                          if (isChecked == false) {
                                            this.index_33 = 0;
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
                                          question_33 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "34. A eu des difficultés à marcher pendant 15 minutes ou à monter quelques marches d\'escalier"),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_34,
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
                                            int index_34) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_34");
                                          this.index_34 = index_34;
                                          if (isChecked == false) {
                                            this.index_34 = 0;
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
                                          question_34 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "35. A eu des difficultés à faire des activités qui requièrent beaucoup d\'énergie comme courir, jouer au football, danser etc.."),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_35,
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
                                            int index_35) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_35");
                                          this.index_35 = index_35;
                                          if (isChecked == false) {
                                            this.index_35 = 0;
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
                                          question_35 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "36. A eu des difficultés à garder ses activités à l\'école ou jouer avec des amis"),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_36,
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
                                            int index_36) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_36");
                                          this.index_36 = index_36;
                                          if (isChecked == false) {
                                            this.index_36 = 0;
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
                                          question_36 = selected;
                                        }),
                                      ),
                                      questionChaq("37. A eu des douleurs "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_37,
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
                                            int index_37) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_37");
                                          this.index_37 = index_37;
                                          if (isChecked == false) {
                                            this.index_37 = 0;
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
                                          question_37 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "38. Est apparu triste ou déprimé"),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_38,
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
                                            int index_38) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_38");
                                          this.index_38 = index_38;
                                          if (isChecked == false) {
                                            this.index_38 = 0;
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
                                          question_38 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "39. Est apparu nerveux ou anxieux "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_39,
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
                                            int index_39) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_39");
                                          this.index_39 = index_39;
                                          if (isChecked == false) {
                                            this.index_39 = 0;
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
                                          question_39 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "40. A eu du mal à s\'entendre avec d\'autres enfants "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_40,
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
                                            int index_40) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_40");
                                          this.index_40 = index_40;
                                          if (isChecked == false) {
                                            this.index_40 = 0;
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
                                          question_40 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "41. A eu des difficultés à se concentrer ou rester attentif"),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_41,
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
                                            int index_41) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_41");
                                          this.index_41 = index_41;
                                          if (isChecked == false) {
                                            this.index_41 = 0;
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
                                          question_41 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "42. Estapparu insatisfait de son apparence physique ou de ses capacités physiques "),
                                      CheckboxGroup(
                                        orientation: GroupedButtonsOrientation
                                            .HORIZONTAL,
                                        labels: categories,
                                        checked: question_42,
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
                                            int index_42) {
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index_42");
                                          this.index_42 = index_42;
                                          if (isChecked == false) {
                                            this.index_42 = 0;
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
                                          question_42 = selected;
                                        }),
                                      ),
                                      questionChaq(
                                          "43. En prenant en compte tous les aspects de la maladie qui affectent votre enfant, jugez comment il se sent en ce moment précis (choisissez le score le plus précis)"),
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
                                                  value: commentSeSentEnfant,
                                                  min: 0.0,
                                                  max: 10.0,
                                                  divisions: 20,
                                                  label: '$commentSeSentEnfant',
                                                  onChanged: (value) {
                                                    if (mounted == true) {
                                                      setState(
                                                        () {
                                                          commentSeSentEnfant =
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
                                      SizedBox(height: 15),
                                      questionChaq(
                                          "44. En prenant compte de toutes les façons dont la maladie influence la vie de votre enfant, seriez vous satisfaits si sa condition restait stable / inchangée pour les prochains mois ?"),
                                      flatButtonMultipleChoice(
                                        title: 'Non',
                                        initValue:
                                            !accordSituationEnfantResteStable,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              accordSituationEnfantResteStable =
                                                  !newValue;
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Oui',
                                        initValue:
                                            accordSituationEnfantResteStable,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              accordSituationEnfantResteStable =
                                                  newValue;
                                            });
                                          }
                                        },
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
                                                HomePatient.routeName,
                                                // arguments: Chaq3Arguments(
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
