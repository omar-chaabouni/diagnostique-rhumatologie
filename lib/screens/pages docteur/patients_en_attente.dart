import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/edit_user_prescription.dart';
import 'package:http/http.dart' as http;
import 'package:rhumatologie/shared/constants.dart';

// ignore: must_be_immutable
class PatientsEnAttente extends StatefulWidget {
  Doctor doctor;
  String token;
  PatientsEnAttente({this.doctor, this.token});
  @override
  _PatientsEnAttenteState createState() => _PatientsEnAttenteState();
}

class _PatientsEnAttenteState extends State<PatientsEnAttente> {
  int selectedIndex = 1;
  bool isChecked = false;
  List waitingPatients = [];
  List filteredWaitingPatients = [];
  bool isSearching = false;
  List<Patient> filteredPatients = [];
  List<Patient> patientList = [];
  bool finished = false;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _getDoctorsAllPatients(widget.doctor.id);
  }

  void _filterwaitingPatients(value) {
    if (this.mounted) {
      setState(() {
        filteredPatients = patientList
            .where((patient) => (patient.nom + ' ' + patient.prenom)
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  _getDoctorsAllPatients(String doctorIdString) async {
    String operationsURL =
        'http://192.168.1.16:4000/doctors/$doctorIdString/patients/waiting';
    try {
      var operationResponse = await http.get("$operationsURL", headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}'
      });
      if (operationResponse.statusCode == 200) {
        finished = true;
        if (json.decode(operationResponse.body)["patients"].isEmpty) {
          patientList = [];
        } else {
          patientList = Patient.patientsFromJson(
              json.encode(json.decode(operationResponse.body)["patients"]));
        }
        if (mounted == true) {
          setState(() {
            filteredPatients = patientList;
          });
        }
      } else {
        finished = true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: gris1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 14,
        ),
        backgroundColor: cyan2,
        title: !isSearching
            ? FlatButton.icon(
                color: Colors.red,
                onPressed: null,
                icon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(FontAwesomeIcons.users,
                      color: Colors.white, size: 20.0),
                ),
                label: Text(
                  "Patients en attente",
                  style: white18Bold,
                ),
              )
            : TextField(
                onChanged: (value) {
                  _filterwaitingPatients(value);
                },
                style: whiteNormal,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Tapez le nom de votre patient",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    if (this.mounted) {
                      setState(() {
                        this.isSearching = false;
                        filteredPatients = patientList;
                      });
                    }
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    if (this.mounted) {
                      setState(() {
                        this.isSearching = true;
                      });
                    }
                  },
                ),
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: (!finished)
            ? Center(
                child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(cyan2),
              ))
            : (filteredPatients.length > 0
                ? Scrollbar(
                    radius: Radius.circular(15.0),
                    controller: scrollController,
                    child: ListView.builder(
                        itemCount: filteredPatients.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditUserPrescription(
                                      doctor: widget.doctor,
                                      token: widget.token,
                                      patient: filteredPatients[index])));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: cyan2, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 2, bottom: 2),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: filteredPatients[
                                                                  index]
                                                              .prenom +
                                                          " ",
                                                      style: black18Bold),
                                                  TextSpan(
                                                      text: filteredPatients[
                                                              index]
                                                          .nom,
                                                      style: black18Bold)
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Icon(
                                              FontAwesomeIcons.edit,
                                              size: 25.0,
                                              color: cyan2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: "N° dossier :  ",
                                              style: cyan16Bold,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    // text: "aa",
                                                    text:
                                                        filteredPatients[index]
                                                                .numDossier
                                                                .toString() ??
                                                            'null',
                                                    style: black16Normal),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RichText(
                                              text: TextSpan(
                                                text: "Diagnostic :  ",
                                                style: cyan16Bold,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: filteredPatients[
                                                                  index]
                                                              .diagnostic ??
                                                          'null',
                                                      style: black16Normal),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : Center(
                    child: Text("Aucun résultat trouvé !".toUpperCase(),
                        style: resultNotFound),
                  )),
      ),
    );
  }
}
