import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

// ignore: camel_case_types
class LoadPage_1 extends StatefulWidget {
  @override
  _LoadPage_1State createState() => _LoadPage_1State();
}

// ignore: camel_case_types
class _LoadPage_1State extends State<LoadPage_1> {
  // final AuthService _auth = AuthService();
  double _value = 30.0;
  bool isChecked1 = false;
  bool isChecked2 = false;
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Icon(FontAwesomeIcons.stethoscope, color: Colors.white),
          label: Text(
            "Diagnostic",
            style: GoogleFonts.oxygen(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 22.0),
          ),
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          color: gris1,
          height: MediaQuery.of(context).size.height,
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
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Combien de fois text test test?",
                        style: GoogleFonts.oxygen(
                            fontWeight: FontWeight.w600,
                            color: cyan2,
                            fontSize: 20.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "0.0",
                          style: black18Bold,
                        ),
                        Container(
                          width: 250,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: cyan3,
                              inactiveTrackColor: cyan2,
                              // trackShape: RoundedRectSliderTrackShape(),
                              // trackHeight: 4.0,
                              // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                              thumbColor: Colors.blueAccent,
                              overlayColor: Colors.purple.withAlpha(32),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 16.0),
                              // tickMarkShape: RoundSliderTickMarkShape(),
                              // activeTickMarkColor: Colors.purple[700],
                              inactiveTickMarkColor: cyan2,
                              valueIndicatorShape:
                                  PaddleSliderValueIndicatorShape(),
                              valueIndicatorColor: Colors.blueAccent,
                              valueIndicatorTextStyle: GoogleFonts.oxygen(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            child: Slider(
                              value: _value,
                              min: 0,
                              max: 100,
                              divisions: 10,
                              label: '$_value',
                              onChanged: (value) {
                                if (mounted == true) {
                                  setState(
                                    () {
                                      _value = value;
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Text(
                          "100.0",
                          style: black18Bold,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: Text(
                        "Combien de fois text test test?",
                        style: GoogleFonts.oxygen(
                            fontWeight: FontWeight.w600,
                            color: cyan2,
                            fontSize: 20.0),
                      ),
                    ),
                    flatButtonMultipleChoice(
                        title: 'test',
                        initValue: isChecked1,
                        onChanged: (newValue) {
                          if (this.mounted) {
                            setState(() {
                              isChecked1 = newValue;
                            });
                          }
                        }),
                    flatButtonMultipleChoice(
                        title: 'test',
                        initValue: isChecked2,
                        onChanged: (newValue) {
                          if (this.mounted) {
                            setState(() {
                              isChecked2 = newValue;
                            });
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text(
                        "Combien de fois text test test?",
                        style: GoogleFonts.oxygen(
                            fontWeight: FontWeight.w600,
                            color: cyan2,
                            fontSize: 20.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 10.0, top: 15.0, right: 20.0, left: 20.0),
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: cyan2, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: TextFormField(
                          cursorColor: cyan2,
                          decoration: InputDecoration(border: InputBorder.none),
                          style: black18Normal),
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
