import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20patient/profile_patient.dart';
import 'package:rhumatologie/screens/pages%20patient/user_drugs.dart';
import 'package:rhumatologie/screens/scores_pages/choose_score.dart';
import 'package:rhumatologie/shared/constants.dart';

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
  @override
  void initState() {
    super.initState();
    // print("houniiiiii" + widget.patient.toString());
    _screens = <Widget>[
      UserDrugs(patient: widget.patient, token: widget.token),
      ChooseScore(patient: widget.patient, token: widget.token),
      Profile(patient: widget.patient, token: widget.token),
    ];
  }

  final PageController _pageController = PageController();
  void _onPageChanged(int index) {
    if (mounted == true) {
      setState(() {
        // print("current  " + _currentIndex.toString());
        _currentIndex = index;
      });
    }
  }

  void _onItemTapped(int selectedIndex) {
    // print("selected  " + selectedIndex.toString());
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
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
    );
  }
}
