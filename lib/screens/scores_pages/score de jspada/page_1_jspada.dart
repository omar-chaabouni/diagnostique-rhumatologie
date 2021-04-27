import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/screens/pages%20patient/home_user.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page1Jspada extends StatefulWidget {
  static const routeName = '/jspada_1';

  @override
  _Page1JspadaState createState() => _Page1JspadaState();
}

class _Page1JspadaState extends State<Page1Jspada> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool testDemanded = true;
  double _nbrArticulationsTumefiees = 0.0;
  double _nbrEnthesesAtteintes = 0.0;
  double _evaluationDouleurPatient = 0.0;
  bool raideurMatinale = false;
  bool douleurSacroiliaqueOuTestPatrickPositif = false;
  bool rachialgiesInflammatoires = false;
  bool uveite = false;
  double _mobiliteShober = 0.0;
  double sommeScore = 0.0;
// NB NB NB :
// score yete7seb /7 mouch 8
// calcul somme elemnts n
// na7ina VSou...
  void calculEtEnvoiSomme() {
    if (_nbrArticulationsTumefiees > 2) {
      sommeScore += 1;
    } else if ((_nbrArticulationsTumefiees >= 1) &&
        (_nbrArticulationsTumefiees <= 2)) {
      sommeScore += 0.5;
    }
    if (_nbrEnthesesAtteintes > 2) {
      sommeScore += 1;
    } else if ((_nbrEnthesesAtteintes >= 1) && (_nbrEnthesesAtteintes <= 2)) {
      sommeScore += 0.5;
    }
    if (_evaluationDouleurPatient >= 5) {
      sommeScore += 1;
    } else if ((_evaluationDouleurPatient >= 1) &&
        (_evaluationDouleurPatient <= 4)) {
      sommeScore += 0.5;
    }
    if (raideurMatinale == true) {
      sommeScore += 1;
    }
    if (douleurSacroiliaqueOuTestPatrickPositif && rachialgiesInflammatoires) {
      sommeScore += 1;
    }
    if (uveite) {
      sommeScore += 1;
    }
    if (_mobiliteShober <= 2) {
      sommeScore += 1;
    }
    print(sommeScore);
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
            "Score JSPADA",
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
                                            bottom: 12.0, top: 4.0),
                                        child: Text(
                                          "Nombre d\'articulations tuméfiées ?",
                                          style: cyan20Bold,
                                        ),
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
                                                  value:
                                                      _nbrArticulationsTumefiees,
                                                  min: 0.0,
                                                  max: 4.0,
                                                  divisions: 4,
                                                  label:
                                                      '$_nbrArticulationsTumefiees',
                                                  onChanged: (value) {
                                                    if (mounted == true) {
                                                      setState(
                                                        () {
                                                          _nbrArticulationsTumefiees =
                                                              value;
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          sliderLimit(4.0),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12.0, top: 4.0),
                                        child: Text(
                                          "Nombre d\'enthèses atteintes ?",
                                          style: cyan20Bold,
                                        ),
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
                                                  value: _nbrEnthesesAtteintes,
                                                  min: 0.0,
                                                  max: 4.0,
                                                  divisions: 4,
                                                  label:
                                                      '$_nbrEnthesesAtteintes',
                                                  onChanged: (value) {
                                                    if (mounted == true) {
                                                      setState(
                                                        () {
                                                          _nbrEnthesesAtteintes =
                                                              value;
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          sliderLimit(4.0),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12.0, top: 4.0),
                                        child: Text(
                                          "Douleur du patient",
                                          style: cyan20Bold,
                                        ),
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
                                                  value:
                                                      _evaluationDouleurPatient,
                                                  min: 0.0,
                                                  max: 10.0,
                                                  divisions: 10,
                                                  label:
                                                      '$_evaluationDouleurPatient',
                                                  onChanged: (value) {
                                                    if (mounted == true) {
                                                      setState(
                                                        () {
                                                          _evaluationDouleurPatient =
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

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 16.0, top: 4.0),
                                        child: Text(
                                          "Raideur matinale > 15 mn ?",
                                          style: cyan20Bold,
                                        ),
                                      ),
                                      flatButtonMultipleChoice(
                                          title: 'Absente',
                                          initValue: !raideurMatinale,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                raideurMatinale = !newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Présente',
                                          initValue: raideurMatinale,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                raideurMatinale = newValue;
                                              });
                                            }
                                          }),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 16.0, top: 4.0),
                                        child: Text(
                                          "Douleur sacroiliaque ou test de Patrick positif ?",
                                          style: cyan20Bold,
                                        ),
                                      ),
                                      flatButtonMultipleChoice(
                                          title: 'Non',
                                          initValue:
                                              !douleurSacroiliaqueOuTestPatrickPositif,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                douleurSacroiliaqueOuTestPatrickPositif =
                                                    !newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Oui',
                                          initValue:
                                              douleurSacroiliaqueOuTestPatrickPositif,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                douleurSacroiliaqueOuTestPatrickPositif =
                                                    newValue;
                                              });
                                            }
                                          }),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 16.0, top: 4.0),
                                        child: Text(
                                          "Rachialgies inflammatoires ?",
                                          style: cyan20Bold,
                                        ),
                                      ),
                                      flatButtonMultipleChoice(
                                          title: 'Absente',
                                          initValue: !rachialgiesInflammatoires,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                rachialgiesInflammatoires =
                                                    !newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Présente',
                                          initValue: rachialgiesInflammatoires,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                rachialgiesInflammatoires =
                                                    newValue;
                                              });
                                            }
                                          }),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 16.0, top: 4.0),
                                        child: Text(
                                          "Uvéite ?",
                                          style: cyan20Bold,
                                        ),
                                      ),
                                      flatButtonMultipleChoice(
                                          title: 'Absente',
                                          initValue: !uveite,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                uveite = !newValue;
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Présente',
                                          initValue: uveite,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                uveite = newValue;
                                              });
                                            }
                                          }),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12.0, top: 4.0),
                                        child: Text(
                                          "Mobilité rachis",
                                          style: cyan20Bold,
                                        ),
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
                                                  value: _mobiliteShober,
                                                  min: 0.0,
                                                  max: 4.0,
                                                  divisions: 4,
                                                  label: '$_mobiliteShober',
                                                  onChanged: (value) {
                                                    if (mounted == true) {
                                                      setState(
                                                        () {
                                                          _mobiliteShober =
                                                              value;
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          sliderLimit(4.0),
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
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                      // content: Text(myController.text),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      10.0))),
                                                      content: Container(
                                                        height: 60,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                                "Test enregistré avec succès",
                                                                style:
                                                                    green18Bold),
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .checkCircle,
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          ],
                                                        ),
                                                      ));
                                                },
                                              );
                                              Future.delayed(
                                                  Duration(seconds: 1), () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        HomeUser.routeName,
                                                        (_) => false);
                                              });
                                            },
                                            focusColor: cyan2,
                                            hoverColor: cyan2,
                                            splashColor: cyan2,
                                            color: cyan2,
                                            child: Container(
                                              width: 120,
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Enregistrer',
                                                    style: white16Bold,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
// Padding(
//                                         padding: const EdgeInsets.only(
//                                             bottom: 10.0, top: 10.0),
//                                         child: Text(
//                                           "Combien de fois text test test?",
//                                           style: cyan20Bold,
//                                         ),
//                                       ),
//                                       flatButtonMultipleChoice(
//                                           title: 'test',
//                                           initValue: isChecked1,
//                                           onChanged: (newValue) {
//                                             if (this.mounted) {
//                                               setState(() {
//                                                 isChecked1 = newValue;
//                                               });
//                                             }
//                                           }),
//                                       flatButtonMultipleChoice(
//                                           title: 'test',
//                                           initValue: isChecked2,
//                                           onChanged: (newValue) {
//                                             if (this.mounted) {
//                                               setState(() {
//                                                 isChecked2 = newValue;
//                                               });
//                                             }
//                                           }),
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
