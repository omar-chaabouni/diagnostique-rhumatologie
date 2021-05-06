import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'dart:async';

class AddPatient extends StatefulWidget {
  Doctor doctor;
  String token;
  AddPatient({this.doctor, this.token});
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  var controllerNomPrenom = TextEditingController();
  var controllerCIN = TextEditingController();
  var controllerTelephone = TextEditingController();
  var controllerNumeroDossier = TextEditingController();
  // var controllerAge = TextEditingController();
  var controllerDiagnostic = TextEditingController();
  var controllerOrdonnance1 = TextEditingController();
  var controllerOrdonnance2 = TextEditingController();
  var controllerOrdonnance3 = TextEditingController();
  var controllerOrdonnance4 = TextEditingController();
  var controllerOrdonnance5 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String birthday = '';
  double evaluationGlobaleFaiteParMedecin = 0.0;
  void _onDone() {
    // List<PersonEntry> entries = [];
    var contenucontrollerNomPrenom = controllerNomPrenom.text;
    var contenucontrollerCIN = controllerCIN.text;
    var contenucontrollerTelephone = controllerTelephone.text;
    var contenucontrollerNumeroDossier = controllerNumeroDossier.text;
    // var contenucontrollerAge = controllerAge.text;
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
    // print("5 :  " + contenucontrollerAge);
    print("6 :  " + contenucontrollerDiagnostic);
    print("7 :  " + contenucontrollerOrdonnance1);
    print("8 :  " + contenucontrollerOrdonnance2);
    print("9 :  " + contenucontrollerOrdonnance3);
    print("10 :  " + contenucontrollerOrdonnance4);
    print("11 :  " + contenucontrollerOrdonnance5);
    //save les données
    // entries.add(PersonEntry(name, age, job));

    @override
    void initState() {
      super.initState();
      print("AddPatient " + widget.doctor.toString());
    }
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
              // await _auth.signOut();
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
                      addPatientTitle("N° Dossier : "),
                      textFormFieldText(
                        controllerNumeroDossier,
                        'Entrez son n° de dossier ',
                        Icon(Icons.folder_shared_rounded,
                            color: gris2, size: 22),
                      ),
                      addPatientTitle("Numéro de téléphone : "),
                      textFormFieldText(
                        controllerTelephone,
                        'Entrez son n° de téléphone ',
                        Icon(FontAwesome.phone_square, color: gris2, size: 22),
                      ),
                      addPatientTitle("Date de naissance : "),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 8.0, top: 8.0, right: 10.0, left: 10.0),
                        padding: EdgeInsets.only(
                            right: 10.0, left: 10.0, bottom: 2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: cyan2, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime(1925, 1, 1),
                                maxTime: DateTime.now(), onConfirm: (date) {
                              print('confirm $date');
                              birthday =
                                  '${date.month}/${date.day}/${date.year}';
                              print('confirm $birthday');
                              // birthday = '${date.year} - ${date.month} - ${date.day}';
                              setState(() {});
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.fr);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            " $birthday",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "  Changer",
                                  style:
                                      TextStyle(color: cyan2, fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      addPatientTitle("Diagnostic : "),
                      textFormFieldText(
                        controllerDiagnostic,
                        'Entrez son diagnostic ',
                        Icon(FontAwesomeIcons.stethoscope,
                            color: gris2, size: 19),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  "Evaluation globale faite par le médecin?",
                                  style: cyan20Bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  sliderLimit(0.0),
                                  Container(
                                    width: 250,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          activeTrackColor: cyan3,
                                          inactiveTrackColor: cyan2,
                                          showValueIndicator:
                                              ShowValueIndicator.always,
                                          thumbColor: Colors.blueAccent,
                                          overlayColor:
                                              Colors.purple.withAlpha(32),
                                          overlayShape: RoundSliderOverlayShape(
                                              overlayRadius: 16.0),
                                          activeTickMarkColor: cyan2,
                                          inactiveTickMarkColor: cyan2,
                                          valueIndicatorShape:
                                              PaddleSliderValueIndicatorShape(),
                                          valueIndicatorColor:
                                              Colors.blueAccent,
                                          valueIndicatorTextStyle: white16Bold,
                                        ),
                                        child: Slider(
                                          value:
                                              evaluationGlobaleFaiteParMedecin,
                                          min: 0.0,
                                          max: 10.0,
                                          divisions: 10,
                                          label:
                                              '$evaluationGlobaleFaiteParMedecin',
                                          onChanged: (value) {
                                            if (mounted == true) {
                                              setState(
                                                () {
                                                  evaluationGlobaleFaiteParMedecin =
                                                      value;
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  sliderLimit(10.0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      addPatientTitle("Ordonnance : "),
                      textFormFieldTextWithoutValidator(
                        controllerOrdonnance1,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldTextWithoutValidator(
                        controllerOrdonnance2,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldTextWithoutValidator(
                        controllerOrdonnance3,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldTextWithoutValidator(
                        controllerOrdonnance4,
                        'Entrez un médicament',
                        Icon(
                          FontAwesomeIcons.pills,
                          color: gris2,
                          size: 21,
                        ),
                      ),
                      textFormFieldTextWithoutValidator(
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
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      HomeDoctor.routeName, (_) => false);
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
