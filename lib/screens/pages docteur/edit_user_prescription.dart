import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'dart:async';

class EditUserPrescription extends StatefulWidget {
  static const routeName = '/country';

  @override
  _EditUserPrescriptionState createState() => _EditUserPrescriptionState();
}

class _EditUserPrescriptionState extends State<EditUserPrescription> {
  // final myController = TextEditingController(text: 'Test test test');
  var textfield1 = <TextEditingController>[];
  var textfield2 = <TextEditingController>[];
  var textfield3 = <TextEditingController>[];
  var textfield4 = <TextEditingController>[];
  var textfield5 = <TextEditingController>[];
  var controller1 = TextEditingController(text: 'test test');
  var controller2 = TextEditingController(text: '2 eme test');
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();
  var controller5 = TextEditingController();
  var cards = <Card>[];

  int nbrCards = 0;
  bool _isButtonDisabled = false;

  void _onDone() {
    // List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var contenuFinalTextField1 = textfield1[i].text;
      var contenuFinalTextField2 = textfield2[i].text;
      var contenuFinalTextField3 = textfield3[i].text;
      var contenuFinalTextField4 = textfield4[i].text;
      var contenuFinalTextField5 = textfield5[i].text;
      print("1 :  " + contenuFinalTextField1);
      print("2 :  " + contenuFinalTextField2);
      print("3 :  " + contenuFinalTextField3);
      print("4 :  " + contenuFinalTextField4);
      print("5 :  " + contenuFinalTextField5);
      // entries.add(PersonEntry(name, age, job));
    }
  }

  TextEditingController _chooseController(index) {
    switch (index) {
      case 0:
        return controller1;
        break;
      case 1:
        return controller2;
        break;
      case 2:
        return controller3;
        break;
      case 3:
        return controller4;
        break;
      case 4:
        return controller5;
        break;
      default:
        return controller1;
    }
  }

  Card createCard(index) {
    print("index " + index.toString());
    textfield1.add(controller1);
    textfield2.add(controller2);
    textfield3.add(controller3);
    textfield4.add(controller4);
    textfield5.add(controller5);

    return Card(
        shadowColor: null,
        shape: null,
        elevation: 0.0,
        child: Container(
          margin: EdgeInsets.only(bottom: 2.0, top: 2.0, right: 5.0, left: 5.0),
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: cyan2, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: TextFormField(
            maxLines: 2,
            cursorColor: cyan2,
            controller: _chooseController(index),
            onChanged: (text) {
              print("TextField ${index + 1} :   $text");
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Veuillez préscrire un traitement",
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(end: 12.0),
                child: Icon(
                  FontAwesomeIcons.pills,
                  size: 30.0,
                  color: cyan2,
                ),
              ),
            ),
            style: black18Normal,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final Map patient = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: Text(
          patient['name'],
          style: white19Normal,
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          color: gris1,
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height-70,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                      child: Text(
                        "Patient",
                        style: GoogleFonts.oxygen(
                            fontWeight: FontWeight.w600,
                            color: cyan2,
                            fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: 10.0, top: 10.0, right: 5.0, left: 5.0),
                        padding: EdgeInsets.only(right: 10.0, left: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: cyan2, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Nom et prénom :  ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Omar Chaabouni test test test",
                                          style: black18Normal),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Date de naissance :  ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "06-05-1976",
                                          style: black18Normal),
                                      // TextSpan(
                                      //     text: ' vous a préscrit ces médicaments : '),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                      child: Text(
                        "Résultat du dernier diagnostique",
                        style: GoogleFonts.oxygen(
                            fontWeight: FontWeight.w600,
                            color: cyan2,
                            fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        margin:
                            EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
                        padding: EdgeInsets.only(right: 10.0, left: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: cyan2, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "Date de diagnostique :  ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "20-10-2020",
                                          style: black18Normal),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Score de JAMAR :  ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "40/60", style: black18Normal),
                                      // TextSpan(
                                      //     text: ' vous a préscrit ces médicaments : '),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Ordonnance",
                            style: GoogleFonts.oxygen(
                                fontWeight: FontWeight.w600,
                                color: cyan2,
                                fontSize: 20.0),
                          ),
                          Spacer(),
                          FlatButton(
                              autofocus: true,
                              focusColor: Colors.white,
                              splashColor: cyan2,
                              highlightColor: Colors.white,
                              color: Colors.white,
                              child: Icon(
                                FontAwesomeIcons.plusSquare,
                                color: _isButtonDisabled
                                    ? Colors.red
                                    : Colors.green,
                                size: 26.0,
                              ),
                              onPressed: _isButtonDisabled
                                  ? null
                                  : () {
                                      print(nbrCards);
                                      if (nbrCards == 4) {
                                        setState(() {
                                          _isButtonDisabled = true;
                                        });
                                      }
                                      if (nbrCards < 5) {
                                        setState(() {
                                          nbrCards++;
                                          cards.add(createCard(nbrCards - 1));
                                        });
                                      }
                                    }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cards.length,
                        itemBuilder: (BuildContext context, int index) {
                          return cards[index];
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new FlatButton(
                          minWidth: 60.0,
                          onPressed: () {
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
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/back_home", (_) => false);
                            });
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
                                  style: GoogleFonts.oxygen(
                                    color: Colors.white,
                                    fontSize: 17,
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
    );
  }
}

// class PatientDetailCard extends StatelessWidget {
//   final String title;
//   final MaterialColor color;
//   PatientDetailCard({this.title, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: color,
//       elevation: 10,
//       child: Center(
//         child: Text(
//           title,
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

// class PatientCard extends StatelessWidget {
//   final String title;
//   const PatientCard({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 10,
//       child: Center(
//           child: Text(
//         title,
//         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       )),
//     );
//   }
// }
