import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

// ignore: must_be_immutable
class AddPatient extends StatefulWidget {
  Doctor doctor;
  String token;
  AddPatient({this.doctor, this.token});
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  var controllerNom = TextEditingController();
  var controllerPrenom = TextEditingController();
  var controllerTelephone = TextEditingController();
  var controllerNumeroDossier = TextEditingController();
  var controllerDiagnostic = TextEditingController();
  var controllerOrdonnance1 = TextEditingController();
  var controllerOrdonnance2 = TextEditingController();
  var controllerOrdonnance3 = TextEditingController();
  var controllerOrdonnance4 = TextEditingController();
  var controllerOrdonnance5 = TextEditingController();
  ScrollController scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  String birthday = '';
  DateTime dateDeNaissance;
  double evaluationGlobaleFaiteParMedecin = 0.0;
  @override
  void initState() {
    super.initState();
    controllerOrdonnance1.text = '';
    controllerOrdonnance2.text = '';
    controllerOrdonnance3.text = '';
    controllerOrdonnance4.text = '';
    controllerOrdonnance5.text = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _onDone() async {
    var contenucontrollerNom = controllerNom.text;
    var contenucontrollerPrenom = controllerPrenom.text;
    var contenucontrollerTelephone = controllerTelephone.text;
    var contenucontrollerNumeroDossier = controllerNumeroDossier.text;
    var contenucontrollerDiagnostic = controllerDiagnostic.text;
    var contenucontrollerOrdonnance1 = controllerOrdonnance1.text;
    var contenucontrollerOrdonnance2 = controllerOrdonnance2.text;
    var contenucontrollerOrdonnance3 = controllerOrdonnance3.text;
    var contenucontrollerOrdonnance4 = controllerOrdonnance4.text;
    var contenucontrollerOrdonnance5 = controllerOrdonnance5.text;
    Patient patient = new Patient();
    patient.nom = contenucontrollerNom;
    patient.prenom = contenucontrollerPrenom;
    patient.telephone = int.parse(contenucontrollerTelephone);
    patient.dateNaissance = dateDeNaissance;
    patient.numDossier = int.parse(contenucontrollerNumeroDossier);
    patient.diagnostic = contenucontrollerDiagnostic;
    patient.evaluation = evaluationGlobaleFaiteParMedecin.toInt();
    List<String> listOrdonnance = [];
    if (contenucontrollerOrdonnance1 != '') {
      listOrdonnance.add(contenucontrollerOrdonnance1);
    }
    if (contenucontrollerOrdonnance2 != '') {
      listOrdonnance.add(contenucontrollerOrdonnance2);
    }
    if (contenucontrollerOrdonnance3 != '') {
      listOrdonnance.add(contenucontrollerOrdonnance3);
    }
    if (contenucontrollerOrdonnance4 != '') {
      listOrdonnance.add(contenucontrollerOrdonnance4);
    }
    if (contenucontrollerOrdonnance5 != '') {
      listOrdonnance.add(contenucontrollerOrdonnance5);
    }
    patient.ordonnance = listOrdonnance;
    String addPatientURL =
        'http://192.168.1.16:4000/doctors/${widget.doctor.id}/patients/add';
    try {
      var addPatientResponse = await http.post("$addPatientURL",
          body: json.encode(patient.toJson()),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${widget.token}',
          });

      if (addPatientResponse.statusCode == 200 ||
          addPatientResponse.statusCode == 201 ||
          addPatientResponse.statusCode == 202 ||
          addPatientResponse.statusCode == 203) {
        await enregistrerAvecSuccess(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeDoctor(
            doctor: widget.doctor,
            token: widget.token,
          ),
        ));
      } else {
        erreurEnregistrement(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gris1,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 14,
        ),
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(FontAwesomeIcons.userPlus,
                color: Colors.white, size: 20.0),
          ),
          label: Text(
            "Ajouter un patient",
            style: white18Bold,
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
                        addPatientTitle("Nom : "),
                        textFormFieldText(
                          controllerNom,
                          'Nom  du patient ',
                          Icon(Icons.account_circle_rounded,
                              color: gris2, size: 20),
                        ),
                        addPatientTitle("Prénom : "),
                        textFormFieldText(
                          controllerPrenom,
                          'Prénom  du patient ',
                          Icon(Icons.account_circle_rounded,
                              color: gris2, size: 20),
                        ),
                        addPatientTitle("N° Dossier : "),
                        textFormFieldText(
                          controllerNumeroDossier,
                          'Entrez son n° de dossier ',
                          Icon(Icons.folder_shared_rounded,
                              color: gris2, size: 20),
                        ),
                        addPatientTitle("Numéro de téléphone : "),
                        textFormFieldText(
                          controllerTelephone,
                          'Entrez son n° de téléphone ',
                          Icon(FontAwesome.phone_square,
                              color: gris2, size: 18),
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
                                dateDeNaissance = date;
                                // birthday =
                                //     '${date.month}/${date.day}/${date.year}';
                                // print('confirm $birthday');
                                birthday =
                                    '${date.year} - ${date.month} - ${date.day}';
                                setState(() {});
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.fr);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              color: gris2, size: 16),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    "Evaluation globale faite par le médecin?",
                                    style: cyan18Bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(child: sliderLimit(0.0), flex: 1),
                                    Flexible(
                                      flex: 6,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                              activeTrackColor: cyan3,
                                              inactiveTrackColor: cyan2,
                                              showValueIndicator:
                                                  ShowValueIndicator.always,
                                              thumbColor: Colors.blueAccent,
                                              overlayColor:
                                                  Colors.purple.withAlpha(32),
                                              overlayShape:
                                                  RoundSliderOverlayShape(
                                                      overlayRadius: 16.0),
                                              activeTickMarkColor: cyan2,
                                              inactiveTickMarkColor: cyan2,
                                              valueIndicatorShape:
                                                  PaddleSliderValueIndicatorShape(),
                                              valueIndicatorColor:
                                                  Colors.blueAccent,
                                              valueIndicatorTextStyle:
                                                  white16Bold,
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
                                    ),
                                    Flexible(
                                      child: sliderLimit(10.0),
                                      flex: 1,
                                    ),
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(
                              FontAwesomeIcons.pills,
                              color: gris2,
                              size: 18,
                            ),
                          ),
                        ),
                        textFormFieldTextWithoutValidator(
                          controllerOrdonnance2,
                          'Entrez un médicament',
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(
                              FontAwesomeIcons.pills,
                              color: gris2,
                              size: 18,
                            ),
                          ),
                        ),
                        textFormFieldTextWithoutValidator(
                          controllerOrdonnance3,
                          'Entrez un médicament',
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(
                              FontAwesomeIcons.pills,
                              color: gris2,
                              size: 18,
                            ),
                          ),
                        ),
                        textFormFieldTextWithoutValidator(
                          controllerOrdonnance4,
                          'Entrez un médicament',
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(
                              FontAwesomeIcons.pills,
                              color: gris2,
                              size: 18,
                            ),
                          ),
                        ),
                        textFormFieldTextWithoutValidator(
                          controllerOrdonnance5,
                          'Entrez un médicament',
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(
                              FontAwesomeIcons.pills,
                              color: gris2,
                              size: 18,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: new FlatButton(
                              minWidth: 60.0,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _onDone();
                                }
                              },
                              focusColor: cyan2,
                              hoverColor: cyan2,
                              splashColor: cyan2,
                              color: cyan2,
                              child: Container(
                                width: 120,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Enregistrer',
                                      style: white16Bold,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
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
      ),
    );
  }
}
