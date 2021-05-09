import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/screens/pages%20docteur/add_patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/patients_en_attente.dart';
import 'package:rhumatologie/screens/pages%20docteur/tous_mes_patients.dart';
import 'package:rhumatologie/shared/constants.dart';

// ignore: must_be_immutable
class HomeDoctor extends StatefulWidget {
  Doctor doctor;
  String token;
  HomeDoctor({Key key, this.doctor, this.token}) : super(key: key);

  @override
  _HomeDoctorState createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  List<Widget> _screens;
  Doctor doctor;
  String token;
  int selectedIndex = 0;
  int _currentIndex = 0;

  void initState() {
    super.initState();
    doctor = widget.doctor;
    token = widget.token;
    _screens = <Widget>[
      PatientsEnAttente(doctor: doctor, token: token),
      AllMyPatients(doctor: doctor, token: token),
      AddPatient(doctor: doctor, token: token),
    ];
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final PageController _pageController = PageController();
  Future<void> _onPageChanged(int index) async {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _onItemTapped(int selectedIndex) {
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
                  size: 14,
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
                        fontSize: 12,
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
                size: 14,
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
                        fontSize: 14,
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
                size: 14,
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
                        fontSize: 14,
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
