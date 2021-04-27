import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/edit_user_prescription.dart';
import 'package:http/http.dart' as http;
// import 'package:rhumatologie/services/auth.dart';
import 'package:rhumatologie/shared/constants.dart';

class ConsultationEnAttente extends StatefulWidget {
  @override
  _ConsultationEnAttenteState createState() => _ConsultationEnAttenteState();
}

class _ConsultationEnAttenteState extends State<ConsultationEnAttente> {
  // final AuthService _auth = AuthService();
  int selectedIndex = 1;
  bool isChecked = false;
  List waitingPatients = [];
  List filteredWaitingPatients = [];
  bool isSearching = false;
  List<dynamic> filteredPatients = [];
  List<dynamic> patientList = [];

  @override
  void initState() {
    _getDoctorsAllPatients();
    super.initState();
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

  _getDoctorsAllPatients() async {
    String operationsURL = 'http://192.168.1.16:4000/doctors/myPatients';
    try {
      var operationResponse = await http.get("$operationsURL");
      // print(operationsURL);
      if (operationResponse.statusCode == 200) {
        patientList = Patient.patientFromJson(operationResponse.body);
        // print(patientList);
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
          child: filteredPatients.length > 0
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
                                    Text(
                                        filteredPatients[index].prenom +
                                                ' ' +
                                                filteredPatients[index].nom ??
                                            'null',
                                        style: black18Bold),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
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
                                    RichText(
                                      text: TextSpan(
                                        text: "Diagnostic :  ",
                                        style: cyan16Bold,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: filteredPatients[index]
                                                      .diagnostic ??
                                                  'null',
                                              style: black16Normal),
                                          // TextSpan(
                                          //     text: ' vous a préscrit ces médicaments : '),
                                        ],
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
                ),
        ));
  }
}
