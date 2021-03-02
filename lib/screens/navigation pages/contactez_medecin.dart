import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/shared/constants.dart';

class ContactezMedecin extends StatefulWidget {
  @override
  _ContactezMedecinState createState() => _ContactezMedecinState();
}

class _ContactezMedecinState extends State<ContactezMedecin> {
  int selectedIndex = 0;

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
            "Contactez votre médecin",
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
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Votre docteur est :",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Dr. Yassine CHAKER",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Vous pouvez le contactez via l'addresse mail :",
                      style: GoogleFonts.oxygen(
                          // fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "chakira@gmail.com",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "ou bien vous pouvez l'appeler sur :",
                      style: GoogleFonts.oxygen(
                          // fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "+216 58205495",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 18.0),
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
