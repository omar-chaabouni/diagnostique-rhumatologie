import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  Patient patient;
  String token;
  Profile({this.patient, this.token});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gris1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Icon(FontAwesomeIcons.addressCard,
              color: Colors.white, size: 20.0),
          label: Text(
            "  Profil",
            style: white20Bold,
          ),
        ),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.logout, color: Colors.white, size: 14),
            label: Text(
              "Se déconnecter",
              style: disconnectStyle,
            ),
            onPressed: () async {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/wrapper', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
      body: Scrollbar(
        radius: Radius.circular(15.0),
        isAlwaysShown: true,
        controller: scrollController,
        child: new SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: gris1,
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
                      SizedBox(height: 8),
                      elementProfile("Nom", "${widget.patient.nom}"),
                      elementProfile("Prénom", "${widget.patient.prenom}"),
                      elementProfile("Age", "${widget.patient.age}"),
                      elementProfile(
                          "N° Dossier", "${widget.patient.numDossier}"),
                      elementProfile(
                          "Diagnostic", "${widget.patient.diagnostic}"),
                      elementProfile(
                          "N° téléphone", "${widget.patient.telephone}"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
