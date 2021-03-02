import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/shared/constants.dart';

class UserHistoryAndDrugs extends StatefulWidget {
  @override
  _UserHistoryAndDrugsState createState() => _UserHistoryAndDrugsState();
}

class _UserHistoryAndDrugsState extends State<UserHistoryAndDrugs> {
  int selectedIndex = 1;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: gris1,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Icon(FontAwesomeIcons.userMd, color: Colors.white),
          label: Text(
            "Votre antécédent médical",
            style: GoogleFonts.oxygen(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 22.0),
          ),
        ),
      ),

      body: Container(
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
                      "Vos 5 dernières consultations :",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "- date *5",
                      style: GoogleFonts.oxygen(
                          color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Médicaments en cours d'utilisation :",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "- Doliprane w medri chnaya",
                      style: GoogleFonts.oxygen(
                          color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
