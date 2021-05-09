import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class Page1Jspada extends StatefulWidget {
  Patient patient;
  String token;
  Page1Jspada({this.patient, this.token});
  @override
  _Page1JspadaState createState() => _Page1JspadaState();
}

class _Page1JspadaState extends State<Page1Jspada> {
  ScrollController scrollController = ScrollController();
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

  void calculEtEnvoiSomme() async {
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
    double scoreFinal = num.parse((sommeScore).toStringAsFixed(3));
    String scoreFinalString = scoreFinal.toString() + " / 7";
    String fillJspadaURL =
        'http://192.168.1.16:4000/patients/${widget.patient.id.toString()}/fillJspada';
    try {
      var fillJspadaResponse = await http.post("$fillJspadaURL",
          body: json.encode({"score": scoreFinalString}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${widget.token}'
          });
      Future.delayed(Duration(milliseconds: 1000), () {
        if (fillJspadaResponse.statusCode == 200 ||
            fillJspadaResponse.statusCode == 201 ||
            fillJspadaResponse.statusCode == 202 ||
            fillJspadaResponse.statusCode == 203) {
          enregistrerAvecSuccess(context);
          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePatient(
                patient: widget.patient,
                token: widget.token,
              ),
            ));
          });
        } else {
          Future.delayed(Duration(milliseconds: 1000), () {
            erreurEnregistrement(context);
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
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
            "Score JSPADA",
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
                                            Flexible(
                                                child: sliderLimit(0.0),
                                                flex: 1),
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: SliderTheme(
                                                    data:
                                                        SliderTheme.of(context)
                                                            .copyWith(
                                                      activeTrackColor: cyan3,
                                                      inactiveTrackColor: cyan2,
                                                      showValueIndicator:
                                                          ShowValueIndicator
                                                              .always,
                                                      thumbColor:
                                                          Colors.blueAccent,
                                                      overlayColor: Colors
                                                          .purple
                                                          .withAlpha(32),
                                                      overlayShape:
                                                          RoundSliderOverlayShape(
                                                              overlayRadius:
                                                                  16.0),
                                                      activeTickMarkColor:
                                                          cyan2,
                                                      inactiveTickMarkColor:
                                                          cyan2,
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
                                            ),
                                            Flexible(
                                                child: sliderLimit(4.0),
                                                flex: 1),
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
                                            Flexible(
                                                child: sliderLimit(0.0),
                                                flex: 1),
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: SliderTheme(
                                                    data:
                                                        SliderTheme.of(context)
                                                            .copyWith(
                                                      activeTrackColor: cyan3,
                                                      inactiveTrackColor: cyan2,
                                                      showValueIndicator:
                                                          ShowValueIndicator
                                                              .always,
                                                      thumbColor:
                                                          Colors.blueAccent,
                                                      overlayColor: Colors
                                                          .purple
                                                          .withAlpha(32),
                                                      overlayShape:
                                                          RoundSliderOverlayShape(
                                                              overlayRadius:
                                                                  16.0),
                                                      activeTickMarkColor:
                                                          cyan2,
                                                      inactiveTickMarkColor:
                                                          cyan2,
                                                      valueIndicatorShape:
                                                          PaddleSliderValueIndicatorShape(),
                                                      valueIndicatorColor:
                                                          Colors.blueAccent,
                                                      valueIndicatorTextStyle:
                                                          white16Bold,
                                                    ),
                                                    child: Slider(
                                                      value:
                                                          _nbrEnthesesAtteintes,
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
                                            ),
                                            Flexible(
                                                child: sliderLimit(4.0),
                                                flex: 1),
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
                                            Flexible(
                                                child: sliderLimit(0.0),
                                                flex: 1),
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: SliderTheme(
                                                    data:
                                                        SliderTheme.of(context)
                                                            .copyWith(
                                                      activeTrackColor: cyan3,
                                                      inactiveTrackColor: cyan2,
                                                      showValueIndicator:
                                                          ShowValueIndicator
                                                              .always,
                                                      thumbColor:
                                                          Colors.blueAccent,
                                                      overlayColor: Colors
                                                          .purple
                                                          .withAlpha(32),
                                                      overlayShape:
                                                          RoundSliderOverlayShape(
                                                              overlayRadius:
                                                                  16.0),
                                                      activeTickMarkColor:
                                                          cyan2,
                                                      inactiveTickMarkColor:
                                                          cyan2,
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
                                            ),
                                            Flexible(
                                                child: sliderLimit(10.0),
                                                flex: 1),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 4.0),
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
                                              bottom: 8.0, top: 4.0),
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
                                              bottom: 8.0, top: 4.0),
                                          child: Text(
                                            "Rachialgies inflammatoires ?",
                                            style: cyan20Bold,
                                          ),
                                        ),
                                        flatButtonMultipleChoice(
                                            title: 'Absente',
                                            initValue:
                                                !rachialgiesInflammatoires,
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
                                            initValue:
                                                rachialgiesInflammatoires,
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
                                              bottom: 8.0, top: 4.0),
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
                                            Flexible(
                                                child: sliderLimit(0.0),
                                                flex: 1),
                                            Flexible(
                                              flex: 6,
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: SliderTheme(
                                                    data:
                                                        SliderTheme.of(context)
                                                            .copyWith(
                                                      activeTrackColor: cyan3,
                                                      inactiveTrackColor: cyan2,
                                                      showValueIndicator:
                                                          ShowValueIndicator
                                                              .always,
                                                      thumbColor:
                                                          Colors.blueAccent,
                                                      overlayColor: Colors
                                                          .purple
                                                          .withAlpha(32),
                                                      overlayShape:
                                                          RoundSliderOverlayShape(
                                                              overlayRadius:
                                                                  16.0),
                                                      activeTickMarkColor:
                                                          cyan2,
                                                      inactiveTickMarkColor:
                                                          cyan2,
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
                                            ),
                                            Flexible(
                                                child: sliderLimit(4.0),
                                                flex: 1),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
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
                                      ],
                                    )
                                  : RichText(
                                      text: TextSpan(
                                        text: 'Score CHAQ ',
                                        style: black18Normal,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: "Dr. ",
                                              style: cyan18Bold1_6),
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
      ),
    );
  }
}
