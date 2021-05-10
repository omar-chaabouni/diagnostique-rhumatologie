import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20patient/choose_score.dart';
import 'package:rhumatologie/screens/pages%20patient/loading_screen_patient.dart';
import 'package:rhumatologie/screens/pages%20patient/profile_patient.dart';
import 'package:rhumatologie/screens/pages%20patient/user_drugs.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePatient extends StatefulWidget {
  Patient patient;
  String token;
  HomePatient({Key key, this.patient, this.token}) : super(key: key);
  @override
  _HomePatientState createState() => _HomePatientState();
}

class _HomePatientState extends State<HomePatient> {
  int selectedIndex = 0;
  List<Widget> _screens = <Widget>[];
  int _currentIndex = 0;
  Patient newPatient;
  @override
  void initState() {
    super.initState();
    _screens = <Widget>[
      LoadingScreenPatient(),
      LoadingScreenPatient(),
      LoadingScreenPatient(),
    ];
    getPatient();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final PageController _pageController = PageController();
  void _onPageChanged(int index) {
    if (mounted == true) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  getPatient() async {
    String getPatientURL = 'http://192.168.1.16:4000/patients/me';
    try {
      var getPatientResponse = await http.get("$getPatientURL", headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}'
      });
      if (getPatientResponse.statusCode == 200 ||
          getPatientResponse.statusCode == 201 ||
          getPatientResponse.statusCode == 202 ||
          getPatientResponse.statusCode == 203) {
        print("succes");
        if (mounted) {
          setState(() {
            newPatient = Patient.fromJson(
                json.decode(getPatientResponse.body)["patient"]);
            widget.patient = newPatient;
            _screens = <Widget>[
              UserDrugs(patient: widget.patient, token: widget.token),
              ChooseScore(patient: widget.patient, token: widget.token),
              Profile(patient: widget.patient, token: widget.token),
            ];
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: gris1,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: 0,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history_edu,
                    color: (_currentIndex == 0) ? cyan2 : gris2,
                  ),
                  // ignore: deprecated_member_use
                  title: Text(
                    'Acceuil',
                    style: GoogleFonts.oxygen(
                      fontSize: 17,
                      color: (_currentIndex == 0) ? cyan2 : gris2,
                    ),
                  )),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.stethoscope,
                  color: (_currentIndex == 1) ? cyan2 : gris2,
                ),
                // ignore: deprecated_member_use
                title: Text('Suivi',
                    style: GoogleFonts.oxygen(
                      fontSize: 20,
                      color: (_currentIndex == 1) ? cyan2 : gris2,
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.addressCard,
                  color: (_currentIndex == 2) ? cyan2 : gris2,
                ),
                // ignore: deprecated_member_use
                title: Text('Profil',
                    style: GoogleFonts.oxygen(
                      fontSize: 20,
                      color: (_currentIndex == 2) ? cyan2 : gris2,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
