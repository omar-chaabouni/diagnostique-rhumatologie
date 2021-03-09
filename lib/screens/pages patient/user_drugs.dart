import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/shared/constants.dart';

class UserDrugs extends StatefulWidget {
  @override
  _UserDrugsState createState() => _UserDrugsState();
}

class _UserDrugsState extends State<UserDrugs> {
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
            style: white22Normal,
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
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Votre docteur ',
                            style: black18Normal,
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Dr. Hanene Lassoued Ferjani ",
                                  style: GoogleFonts.oxygen(
                                      fontWeight: FontWeight.w600,
                                      color: cyan2,
                                      height: 1.6,
                                      fontSize: 18.0)),
                              TextSpan(
                                  text: ' vous a préscrit ces médicaments : '),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: cyan2, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, left: 5.0, bottom: 5.0),
                                  child: Icon(
                                    FontAwesomeIcons.pills,
                                    size: 30.0,
                                    color: cyan2,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Doliprane  5 fois par jour 15 jours test 216 tessst et tessst  ",
                                    style: black18Normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 30.0),
                    child: Text(
                      "Si vous voulez contacter votre médecin :",
                      style: black18Normal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.mail,
                            color: cyan2,
                            size: 18.0,
                          ),
                        ),
                        Text(
                          "docteurdocteurdocteur@gmail.com",
                          style: cyan18Bold,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.phone, color: cyan2, size: 18.0),
                      ),
                      Text(
                        "+216 58205495",
                        style: cyan18Bold,
                      ),
                    ],
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
