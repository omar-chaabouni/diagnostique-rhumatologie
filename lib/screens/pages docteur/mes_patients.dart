import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/edit_user_prescription.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:http/http.dart' as http;

class MyPatients extends StatefulWidget {
  final Doctor doctor;
  final String token;
  MyPatients({this.doctor, this.token});
  @override
  _MyPatientsState createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  int selectedIndex = 1;
  bool isChecked = false;
  // List waitingPatients = [];
  List<dynamic> filteredPatients = [];
  bool isSearching = false;
  List<dynamic> patientList = [];

  @override
  void initState() {
    super.initState();
    // print("MyPatients " + widget.doctor.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getDoctorsAllPatients(widget.doctor.id);
    // Patient p =
    //     Patient(age: 10, nom: '', prenom: '', diagnostic: '', numDossier: 25);
    // filteredPatients.add(p);
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
    // await Future.delayed(Duration(seconds: 3));
    String operationsURL =
        'http://192.168.1.16:4000/doctors/$doctorIdString/patients';
    try {
      var operationResponse = await http.get("$operationsURL", headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}'
      });
      // print(operationResponse.body);
      if (operationResponse.statusCode == 200) {
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
          backgroundColor: cyan2,
          title: !isSearching
              ? FlatButton.icon(
                  onPressed: null,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(FontAwesomeIcons.users,
                        color: Colors.white, size: 22.0),
                  ),
                  label: Text(
                    "Tout mes patients",
                    style: white19Normal,
                  ),
                )
              : TextField(
                  onChanged: (value) {
                    _filterwaitingPatients(value);
                  },
                  style: GoogleFonts.oxygen(color: Colors.white),
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
                // await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child:
              // (filteredPatients.length == 0)
              //     ? Center(
              //         child: Text("Aucun résultat trouvé !".toUpperCase(),
              //             style: resultNotFound))
              //     :
              (filteredPatients.length > 0
                  ? ListView.builder(
                      itemCount: filteredPatients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                EditUserPrescription.routeName,
                                arguments: filteredPatients[index]);
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
                                                    text:
                                                        filteredPatients[index]
                                                            .prenom,
                                                    style: black18Bold),
                                                TextSpan(
                                                    text:
                                                        filteredPatients[index]
                                                            .nom,
                                                    style: black18Bold)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Icon(
                                            FontAwesomeIcons.edit,
                                            size: 25.0,
                                            color: cyan2,
                                            // onPressed: (){print('test');},
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
                                                  text: filteredPatients[index]
                                                          .numDossier
                                                          .toString() ??
                                                      'null',
                                                  style: black16Normal),
                                              // TextSpan(
                                              //     text: ' vous a préscrit ces médicaments : '),
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
                                                    // text: "aa"
                                                    text:
                                                        filteredPatients[index]
                                                                .diagnostic ??
                                                            'null',
                                                    style: black16Normal),
                                                // TextSpan(
                                                //     text: ' vous a préscrit ces médicaments : '),
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
                      })
                  : Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(cyan2),
                      ),
                      // child: Text("Aucun résultat trouvé !".toUpperCase(),
                      //     style: resultNotFound),
                    )),
        ));
  }
}
