import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/services/auth.dart';
import 'package:rhumatologie/shared/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: gris1,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Icon(FontAwesomeIcons.addressCard, color: Colors.white),
          label: Text(
            "Profil enfant",
            style: GoogleFonts.oxygen(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 22.0),
          ),
        ),
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: Text(
              "Se déconnecter",
              style: GoogleFonts.oxygen(
                  // fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 14.0),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
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
                      "Nom et prénom de votre enfant:",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Omar CHAABOUNI",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Age",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "12",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Votre adresse email",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: cyan2,
                          fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "aaaaaa@gmail.com",
                      style: GoogleFonts.oxygen(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: MycustomNavigationBar(3),
    );
  }
}
