import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/screens/pages%20docteur/edit_user_prescription.dart';
import 'package:rhumatologie/services/auth.dart';
import 'package:rhumatologie/shared/constants.dart';

class MyPatients extends StatefulWidget {
  @override
  _MyPatientsState createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  final AuthService _auth = AuthService();
  int selectedIndex = 1;
  bool isChecked = false;
  List waitingPatients = [];
  List filteredWaitingPatients = [];
  bool isSearching = false;
  getwaitingPatients() async {
    var response = await Dio().get('https://restCountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    getwaitingPatients().then((data) {
      setState(() {
        waitingPatients = filteredWaitingPatients = data;
      });
    });
    super.initState();
  }

  void _filterwaitingPatients(value) {
    setState(() {
      filteredWaitingPatients = waitingPatients
          .where((country) =>
              country['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
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
                  child: Icon(FontAwesomeIcons.userClock, color: Colors.white),
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
                    setState(() {
                      this.isSearching = false;
                      filteredWaitingPatients = waitingPatients;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                ),
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: filteredWaitingPatients.length > 0
            ? ListView.builder(
                itemCount: filteredWaitingPatients.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          EditUserPrescription.routeName,
                          arguments: filteredWaitingPatients[index]);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: cyan2, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              filteredWaitingPatients[index]['name'],
                              style: GoogleFonts.oxygen(fontSize: 18),
                            ),
                            Spacer(),
                            Icon(
                              FontAwesomeIcons.edit,
                              size: 18.0,
                              color: cyan2,
                              // onPressed: (){print('test');},
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(cyan2),
                ),
              ),
      ),
    );
  }
}
