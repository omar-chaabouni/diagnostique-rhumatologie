import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/screens/pages%20docteur/consulations_en_attente.dart';
import 'package:rhumatologie/screens/pages%20docteur/mes_patients.dart';
import 'package:rhumatologie/shared/constants.dart';

// Diagnostique PAGE
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
  ];
  int _currentIndex = 0;

  final PageController _pageController = PageController();
  void _onPageChanged(int index) {
    setState(() {
      // print("current  " + _currentIndex.toString());
      _currentIndex = index;
    });
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
      body:
          PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      // ),

      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.userClock,
                  size: 22,
                  color: (_currentIndex == 0) ? cyan2 : gris2,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  'Consultations en attente',
                  style: GoogleFonts.oxygen(
                    fontSize: 17,
                    color: (_currentIndex == 0) ? cyan2 : gris2,
                  ),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.users,
                size: 22,
                color: (_currentIndex == 1) ? cyan2 : gris2,
              ),
              // ignore: deprecated_member_use
              title: Text('Mes patients',
                  style: GoogleFonts.oxygen(
                    fontSize: 20,
                    color: (_currentIndex == 1) ? cyan2 : gris2,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
