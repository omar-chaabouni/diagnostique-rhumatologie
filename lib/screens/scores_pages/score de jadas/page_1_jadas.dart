import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/screens/pages%20patient/home_user.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page1Jadas extends StatefulWidget {
  static const routeName = '/jadas_1';

  @override
  _Page1JadasState createState() => _Page1JadasState();
}

class _Page1JadasState extends State<Page1Jadas> {
  double _evaluationGlobaleParParent = 0.0;
  double _nbrArticulationsTumefiees = 0.0;
  double _vitesseSedimentation = 0.0;
  double d = 0;
  double sommeScore = 0;
  int selectedIndex = 1;
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
        d = _vitesseSedimentation;
      });
    }
  }

  void calculEtEnvoiSomme() {
    sommeScore = _evaluationGlobaleParParent +
        _evaluationGlobaleParParent +
        _nbrArticulationsTumefiees +
        d;
    print(sommeScore / 71);
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
          icon: Icon(FontAwesomeIcons.fileAlt, color: Colors.white),
          label: Text(
            "Score JADAS",
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
                        sliderLimit(0.0),
                        Container(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: cyan3,
                                inactiveTrackColor: cyan2,
                                showValueIndicator: ShowValueIndicator.always,
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
                        sliderLimit(10.0),
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
                        sliderLimit(0.0),
                        Container(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: cyan3,
                                inactiveTrackColor: cyan2,
                                showValueIndicator: ShowValueIndicator.always,
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
                        sliderLimit(10.0),
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
                        sliderLimit(0.0),
                        Container(
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: cyan3,
                                inactiveTrackColor: cyan2,
                                showValueIndicator: ShowValueIndicator.always,
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
                        sliderLimit(180.0),
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
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    // content: Text(myController.text),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    content: Container(
                                      height: 60,
                                      child: Column(
                                        children: [
                                          Text("Test enregistré avec succès",
                                              style: green18Bold),
                                          Icon(
                                            FontAwesomeIcons.checkCircle,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            );
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, HomeUser.routeName, (_) => false);
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
    );
  }
}
