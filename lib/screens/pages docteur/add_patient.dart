import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/services/auth.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'dart:async';

class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  final AuthService _auth = AuthService();
  var controllerNomPrenom = TextEditingController();
  var controllerCIN = TextEditingController();
  var controllerTelephone = TextEditingController();
  var controllerNumeroDossier = TextEditingController();
  var controllerAge = TextEditingController();
  var controllerDiagnostic = TextEditingController();
  var controllerOrdonnance1 = TextEditingController();
  var controllerOrdonnance2 = TextEditingController();
  var controllerOrdonnance3 = TextEditingController();
  var controllerOrdonnance4 = TextEditingController();
  var controllerOrdonnance5 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onDone() {
    // List<PersonEntry> entries = [];
    var contenucontrollerNomPrenom = controllerNomPrenom.text;
    var contenucontrollerCIN = controllerCIN.text;
    var contenucontrollerTelephone = controllerTelephone.text;
    var contenucontrollerNumeroDossier = controllerNumeroDossier.text;
    var contenucontrollerAge = controllerAge.text;
    var contenucontrollerDiagnostic = controllerDiagnostic.text;
    var contenucontrollerOrdonnance1 = controllerOrdonnance1.text;
    var contenucontrollerOrdonnance2 = controllerOrdonnance2.text;
    var contenucontrollerOrdonnance3 = controllerOrdonnance3.text;
    var contenucontrollerOrdonnance4 = controllerOrdonnance4.text;
    var contenucontrollerOrdonnance5 = controllerOrdonnance5.text;
    print("1 :  " + contenucontrollerNomPrenom);
    print("2 :  " + contenucontrollerCIN);
    print("3 :  " + contenucontrollerTelephone);
    print("4 :  " + contenucontrollerNumeroDossier);
    print("5 :  " + contenucontrollerAge);
    print("6 :  " + contenucontrollerDiagnostic);
    print("7 :  " + contenucontrollerOrdonnance1);
    print("8 :  " + contenucontrollerOrdonnance2);
    print("9 :  " + contenucontrollerOrdonnance3);
    print("10 :  " + contenucontrollerOrdonnance4);
    print("11 :  " + contenucontrollerOrdonnance5);
    //save les données
    // entries.add(PersonEntry(name, age, job));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: gris1,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(FontAwesomeIcons.userPlus,
                color: Colors.white, size: 22.0),
          ),
          label: Text(
            "Ajouter un patient",
            style: white19Normal,
          ),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'Se déconnecter',
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: new SingleChildScrollView(
        child: Container(
          color: gris1,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: const EdgeInsets.only(
                left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      addPatientTitle("Nom et prénom : "),
                      textFormFieldText(
                        controllerNomPrenom,
                        'Nom et le prénom du patient ',
                        Icon(Icons.account_circle_rounded,
                            color: gris2, size: 25),
                      ),
                      addPatientTitle("Numéro CIN : "),
                      textFormFieldText(
                        controllerCIN,
                        'Entrez son n° de carte CIN',
                        Icon(FontAwesome.id_card, color: gris2, size: 19),
                      ),
                      addPatientTitle("Numéro de téléphone : "),
                      textFormFieldText(
                        controllerTelephone,
                        'Entrez son n° de téléphone ',
                        Icon(FontAwesome.phone_square, color: gris2, size: 22),
                      ),
                      addPatientTitle("N° Dossier : "),
                      textFormFieldText(
                        controllerNumeroDossier,
                        'Entrez son n° de dossier ',
                        Icon(Icons.folder_shared_rounded,
                            color: gris2, size: 22),
                      ),
                      addPatientTitle("Age : "),
                      textFormFieldNumber(
                        controllerAge,
                        'Entrez son age ',
                        Icon(
                          Icons.cake,
                          color: gris2,
                          size: 19.0,
                        ),
                      ),
                      addPatientTitle("Diagnostic : "),
                      textFormFieldText(
                        controllerDiagnostic,
                        'Entrez son diagnostic ',
                        Icon(FontAwesomeIcons.stethoscope,
                            color: gris2, size: 19),
                      ),
                      addPatientTitle("Ordonnance : "),
                      textFormFieldText(
                        controllerOrdonnance1,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldText(
                        controllerOrdonnance2,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldText(
                        controllerOrdonnance3,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldText(
                        controllerOrdonnance4,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldText(
                        controllerOrdonnance5,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: new FlatButton(
                            minWidth: 60.0,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.

                                _onDone();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        // content: Text(myController.text),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        content: Container(
                                          height: 60,
                                          child: Column(
                                            children: [
                                              Text(
                                                "Enregistré avec succès",
                                                style: GoogleFonts.oxygen(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green,
                                                    fontSize: 18.0),
                                              ),
                                              Icon(
                                                FontAwesomeIcons.checkCircle,
                                                color: Colors.green,
                                              )
                                            ],
                                          ),
                                        ));
                                  },
                                );
                                Timer(Duration(seconds: 2), () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      "/back_home_doctor", (_) => false);
                                });
                              }
                            },
                            focusColor: cyan2,
                            hoverColor: cyan2,
                            splashColor: cyan2,
                            color: cyan2,
                            child: Container(
                              width: 126,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Enregistrer',
                                    style: GoogleFonts.oxygen(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Icon(
                                      Icons.save,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
