import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/screens/pages%20docteur/add_patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/consulations_en_attente.dart';
import 'package:rhumatologie/screens/pages%20docteur/mes_patients.dart';
import 'package:rhumatologie/shared/constants.dart';

// Diagnostic PAGE
class HomeDoctor extends StatefulWidget {
  HomeDoctor({Key key}) : super(key: key);
  // final AuthService _auth = AuthService();
  @override
  _HomeDoctorState createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  int selectedIndex = 0;
  List<Widget> _screens = <Widget>[
    ConsultationEnAttente(),
    MyPatients(),
    AddPatient(),
  ];
  int _currentIndex = 0;

  final PageController _pageController = PageController();
  Future<void> _onPageChanged(int index) async {
    if (mounted) {
      setState(() {
        // print("current  " + _currentIndex.toString());
        _currentIndex = index;
      });
    }
  }

  void _onItemTapped(int selectedIndex) {
    // print("selected  " + selectedIndex.toString());
    _pageController.jumpToPage(selectedIndex);
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
      // ),

      bottomNavigationBar: SizedBox(
        height: 82,
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: Icon(
                  FontAwesomeIcons.userClock,
                  size: 18,
                  color: (_currentIndex == 0) ? cyan2 : gris2,
                ),
              ),
              // ignore: deprecated_member_use
              title: SizedBox(
                height: 30.0,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0),
                    child: Text(
                      'Patients en attente',
                      maxLines: 2,
                      style: GoogleFonts.oxygen(
                        fontSize: 14,
                        color: (_currentIndex == 0) ? cyan2 : gris2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.users,
                size: 18,
                color: (_currentIndex == 1) ? cyan2 : gris2,
              ),
              // ignore: deprecated_member_use
              title: SizedBox(
                height: 30.0,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0),
                    child: Text(
                      'Mes patients',
                      maxLines: 2,
                      style: GoogleFonts.oxygen(
                        fontSize: 18,
                        color: (_currentIndex == 1) ? cyan2 : gris2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userPlus,
                size: 18,
                color: (_currentIndex == 2) ? cyan2 : gris2,
              ),
              // ignore: deprecated_member_use
              title: SizedBox(
                height: 30.0,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0),
                    child: Text(
                      'Ajouter patient',
                      maxLines: 2,
                      style: GoogleFonts.oxygen(
                        fontSize: 18,
                        color: (_currentIndex == 2) ? cyan2 : gris2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
