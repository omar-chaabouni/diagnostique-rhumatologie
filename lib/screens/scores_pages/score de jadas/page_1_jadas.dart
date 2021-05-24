import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Page1Jadas extends StatefulWidget {
  Patient patient;
  String token;
  Page1Jadas({this.patient, this.token});
  @override
  _Page1JadasState createState() => _Page1JadasState();
}

class _Page1JadasState extends State<Page1Jadas> {
  ScrollController scrollController = ScrollController();
  double _evaluationGlobaleParParent = 0.0;
  double _nbrArticulationsTumefiees = 0.0;
  double _vitesseSedimentation = 0.0;
  double _evaluationGlobaleParMedecin = 0.0;
  double d = 0;
  double sommeScore = 0;
  int selectedIndex = 1;
  @override
  void initState() {
    super.initState();
    _evaluationGlobaleParMedecin = widget.patient.evaluation.toDouble();
  }

  void _setD() {
    if (_vitesseSedimentation < 20) {
      setState(() {
        d = 0;
      });
    } else if (_vitesseSedimentation > 120) {
      setState(() {
        d = 10;
      });
    } else {
      setState(() {
        d = (_vitesseSedimentation - 20) / 10;
      });
    }
  }

  void calculEtEnvoiSomme() async {
    sommeScore = _evaluationGlobaleParMedecin +
        _evaluationGlobaleParParent +
        _nbrArticulationsTumefiees +
        d;
    double scoreFinal = num.parse((sommeScore).toStringAsFixed(3));
    String scoreFinalString = scoreFinal.toString() + " / 40";
    String fillJadasURL =
        '$baseUrl/patients/${widget.patient.id.toString()}/fillJadas';
    try {
      var fillJadasResponse = await http.post("$fillJadasURL",
          body: json.encode({"score": scoreFinalString}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${widget.token}'
          });
      if (fillJadasResponse.statusCode == 200 ||
          fillJadasResponse.statusCode == 201 ||
          fillJadasResponse.statusCode == 202 ||
          fillJadasResponse.statusCode == 203) {
        await enregistrerAvecSuccess(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePatient(
            patient: widget.patient,
            token: widget.token,
          ),
        ));
      } else {
        erreurEnregistrement(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gris1,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: (null),
          icon: Icon(FontAwesomeIcons.fileAlt, color: Colors.white, size: 20.0),
          label: Text(
            "Score JADAS",
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
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "Evaluation globale faite par le parent?",
                          style: cyan20Bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(child: sliderLimit(0.0), flex: 1),
                          Flexible(
                            flex: 6,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: cyan3,
                                    inactiveTrackColor: cyan2,
                                    showValueIndicator:
                                        ShowValueIndicator.always,
                                    thumbColor: Colors.blueAccent,
                                    overlayColor: Colors.purple.withAlpha(32),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 16.0),
                                    activeTickMarkColor: cyan2,
                                    inactiveTickMarkColor: cyan2,
                                    valueIndicatorShape:
                                        PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.blueAccent,
                                    valueIndicatorTextStyle: white16Bold,
                                  ),
                                  child: Slider(
                                    value: _evaluationGlobaleParParent,
                                    min: 0.0,
                                    max: 10.0,
                                    divisions: 10,
                                    label: '$_evaluationGlobaleParParent',
                                    onChanged: (value) {
                                      if (mounted == true) {
                                        setState(
                                          () {
                                            _evaluationGlobaleParParent = value;
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(child: sliderLimit(10.0), flex: 1),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "Nombre d'articulations tumifiées ?",
                          style: cyan20Bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(child: sliderLimit(0.0), flex: 1),
                          Flexible(
                            flex: 6,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: cyan3,
                                    inactiveTrackColor: cyan2,
                                    showValueIndicator:
                                        ShowValueIndicator.always,
                                    thumbColor: Colors.blueAccent,
                                    overlayColor: Colors.purple.withAlpha(32),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 16.0),
                                    activeTickMarkColor: cyan2,
                                    inactiveTickMarkColor: cyan2,
                                    valueIndicatorShape:
                                        PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.blueAccent,
                                    valueIndicatorTextStyle: white16Bold,
                                  ),
                                  child: Slider(
                                    value: _nbrArticulationsTumefiees,
                                    min: 0.0,
                                    max: 10.0,
                                    divisions: 10,
                                    label: '$_nbrArticulationsTumefiees',
                                    onChanged: (value) {
                                      if (mounted == true) {
                                        setState(
                                          () {
                                            _nbrArticulationsTumefiees = value;
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(child: sliderLimit(10.0), flex: 1),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "Vitesse de sédimentation ?",
                          style: cyan20Bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(child: sliderLimit(0.0), flex: 1),
                          Flexible(
                            flex: 5,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: cyan3,
                                    inactiveTrackColor: cyan2,
                                    showValueIndicator:
                                        ShowValueIndicator.always,
                                    thumbColor: Colors.blueAccent,
                                    overlayColor: Colors.purple.withAlpha(32),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 16.0),
                                    activeTickMarkColor: cyan2,
                                    inactiveTickMarkColor: cyan2,
                                    valueIndicatorShape:
                                        PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.blueAccent,
                                    valueIndicatorTextStyle: white16Bold,
                                  ),
                                  child: Slider(
                                    value: _vitesseSedimentation,
                                    min: 0.0,
                                    max: 180.0,
                                    divisions: 18,
                                    label: '${_vitesseSedimentation.round()}',
                                    onChanged: (value) {
                                      if (mounted == true) {
                                        setState(
                                          () {
                                            _vitesseSedimentation = value;
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(child: sliderLimit(180.0), flex: 1),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: new FlatButton(
                            minWidth: 60.0,
                            onPressed: () {
                              _setD();
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
                                    padding: const EdgeInsets.only(left: 12.0),
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
