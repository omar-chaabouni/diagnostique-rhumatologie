import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/screens/pages%20patient/profile.dart';
import 'package:rhumatologie/screens/pages%20patient/user_drugs.dart';
import 'package:rhumatologie/screens/survey_pages/page_1.dart';
import 'package:rhumatologie/shared/constants.dart';

// Diagnostique PAGE
class HomeUser extends StatefulWidget {
  HomeUser({Key key}) : super(key: key);
  // final AuthService _auth = AuthService();
  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  int selectedIndex = 0;
  List<Widget> _screens = <Widget>[
    UserDrugs(),
    LoadPage_1(),
    // ContactezMedecin(),
    Profile(),
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
                  'Antécédent',
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
              title: Text('Diagnostique',
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
