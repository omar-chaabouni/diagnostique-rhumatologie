import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/historique_arguments.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/details_score.dart';
import 'package:rhumatologie/screens/pages%20docteur/historique_score.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'dart:async';

// ignore: must_be_immutable
class EditUserPrescription extends StatefulWidget {
  static const routeName = '/patient';
  Patient patient;

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
  var cardsOrdonnance = <Card>[];
  var cardsScore = <Card>[];
  bool isChecked1 = false;
  bool isChecked2 = false;

  List<String> scoreNames = [
    'JADAS',
    'JSPADA',
    'CHAQ',
    'JAMAR'
  ]; // ordre à spécifier
  List scoreResults = <String>['40/60', '20/30', '26.2/30', '40/20']; // mel BD
  bool haveScores = true; // mel BD kenou compte jdid
  List<bool> demanderTest = [false, false, false, false]; // yjiwni mel BD
  int nbrCards = 0;
  bool _isAddOrdonnanceButtonDisabled = false;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget?.patient = ModalRoute.of(context).settings.arguments;
  }

  void _onDone() {
    // List<PersonEntry> entries = [];
    for (int i = 0; i < cardsOrdonnance.length; i++) {
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

  Column createAllScores() {
    return Column(children: [
      createScore(scoreNames[0], scoreResults[0], 0, widget.patient),
      createScore(scoreNames[1], scoreResults[1], 1, widget.patient),
      createScore(scoreNames[2], scoreResults[2], 2, widget.patient),
      createScoreJamar(scoreNames[3], scoreResults[3], 3),
    ]);
  }

  Card createScoreJamar(String typeScore, String score, int index) {
    return Card(
      shadowColor: null,
      shape: null,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          margin: EdgeInsets.only(right: 5.0, left: 5.0),
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
                      text: "Date de prise du test :  ",
                      style: black18Bold,
                      children: <TextSpan>[
                        TextSpan(text: "20-10-2020", style: black18Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Score de " + typeScore + " :  ",
                      style: black18Bold,
                      children: <TextSpan>[
                        TextSpan(text: score, style: black18Normal),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new FlatButton(
                          onPressed: () {
                            // if (mounted == true) {
                            //   setState(() {
                            //     //action : envoyer requete walla notification
                            //   });
                            // }
                            Navigator.of(context).pushNamed(
                                DetailsScore.routeName,
                                arguments: widget?.patient);
                          },
                          focusColor: cyan2,
                          hoverColor: cyan2,
                          splashColor: cyan2,
                          color: cyan2,
                          child: Container(
                            width: 80,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Détails',
                                  style: GoogleFonts.oxygen(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Icon(
                                    Icons.info,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                HistoriqueScore.routeName,
                                arguments: HistoriqueArguments(
                                    patient: widget?.patient,
                                    typeScore: typeScore));
                          },
                          focusColor: cyan2,
                          hoverColor: cyan2,
                          splashColor: cyan2,
                          color: cyan2,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Voir historique',
                                  style: GoogleFonts.oxygen(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Icon(
                                    FontAwesomeIcons.history,
                                    size: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  demanderTest[index]
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              new FlatButton(
                                onPressed: () {
                                  Future.delayed(Duration(milliseconds: 100),
                                      () {
                                    if (mounted == true) {
                                      setState(() {
                                        demanderTest[index] = false;
                                        //action : envoyer requete walla notification
                                      });
                                    }
                                  });
                                },
                                focusColor: Colors.red,
                                hoverColor: Colors.red,
                                splashColor: Colors.red,
                                color: Colors.red,
                                child: Container(
                                  width: 140,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Test demandé',
                                            style: GoogleFonts.oxygen(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0),
                                            child: Icon(
                                              FontAwesomeIcons.fileAlt,
                                              size: 16.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ])
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new FlatButton(
                              onPressed: () {
                                Future.delayed(Duration(milliseconds: 100), () {
                                  if (mounted == true) {
                                    setState(() {
                                      demanderTest[index] = true;
                                      //action : envoyer requete walla notification
                                    });
                                  }
                                });
                              },
                              focusColor: Colors.green,
                              hoverColor: Colors.green,
                              splashColor: Colors.green,
                              color: Colors.green,
                              child: Container(
                                width: 140,
                                child: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Demander test',
                                          style: GoogleFonts.oxygen(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 6.0),
                                          child: Icon(
                                            FontAwesomeIcons.fileAlt,
                                            size: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
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
      ),
    );
  }

  Card createScore(String typeScore, String score, int index, Patient patient) {
    return Card(
      shadowColor: null,
      shape: null,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          margin: EdgeInsets.only(right: 5.0, left: 5.0),
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
                      text: "Date de prise du test :  ",
                      style: black18Bold,
                      children: <TextSpan>[
                        TextSpan(
                            text: "${patient.jadas[0].dateValidation}",
                            style: black18Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Score de " + typeScore + " :  ",
                      style: black18Bold,
                      children: <TextSpan>[
                        TextSpan(text: score, style: black18Normal),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                HistoriqueScore.routeName,
                                arguments: HistoriqueArguments(
                                    patient: widget?.patient,
                                    typeScore: typeScore));
                          },
                          focusColor: cyan2,
                          hoverColor: cyan2,
                          splashColor: cyan2,
                          color: cyan2,
                          child: Container(
                            width: 102,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Historique',
                                  style: GoogleFonts.oxygen(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Icon(
                                    FontAwesomeIcons.history,
                                    size: 18.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      demanderTest[index]
                          ? Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: new FlatButton(
                                onPressed: () {
                                  Future.delayed(Duration(milliseconds: 100),
                                      () {
                                    if (mounted == true) {
                                      setState(() {
                                        demanderTest[index] = false;
                                        //action : envoyer requete walla notification
                                      });
                                    }
                                  });
                                },
                                focusColor: Colors.red,
                                hoverColor: Colors.red,
                                splashColor: Colors.red,
                                color: Colors.red,
                                child: Container(
                                  width: 125,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Test demandé',
                                            style: GoogleFonts.oxygen(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Icon(
                                              FontAwesomeIcons.fileAlt,
                                              size: 14.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: new FlatButton(
                                onPressed: () {
                                  Future.delayed(Duration(milliseconds: 100),
                                      () {
                                    if (mounted == true) {
                                      setState(() {
                                        demanderTest[index] = true;
                                        //action : envoyer requete walla notification
                                      });
                                    }
                                  });
                                },
                                focusColor: Colors.green,
                                hoverColor: Colors.green,
                                splashColor: Colors.green,
                                color: Colors.green,
                                child: Container(
                                  width: 125,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Demander test',
                                            style: GoogleFonts.oxygen(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Icon(
                                              FontAwesomeIcons.fileAlt,
                                              size: 14.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
      ),
    );
  }

  Card createOrdonnance(index) {
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
            maxLines: 1,
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
                  size: 25.0,
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
    final Patient patient = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: gris1,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 10.0, right: 14.0, top: 10.0),
              child: Icon(FontAwesomeIcons.userInjured, size: 22),
            ),
            Text(
              patient.prenom + '  ' + patient.nom,
              style: white19Normal,
            ),
          ],
        ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 8.0),
                      child: Text(
                        "Patient",
                        style: cyan20Bold,
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
                                          text:
                                              "${patient?.prenom} ${patient?.nom}",
                                          style: black18Normal),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "N° dossier :  ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "${patient?.numDossier}",
                                          style: black18Normal),
                                      // TextSpan(
                                      //     text: ' vous a préscrit ces médicaments : '),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Age :  ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "12", style: black18Normal),
                                      // TextSpan(
                                      //     text: ' vous a préscrit ces médicaments : '),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Diagnostic :  ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "${patient?.diagnostic}",
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
                    (haveScores == true)
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 8.0),
                            child: Text(
                              "Résultat du dernier diagnostic",
                              style: GoogleFonts.oxygen(
                                  fontWeight: FontWeight.w600,
                                  color: cyan2,
                                  fontSize: 20.0),
                            ),
                          )
                        : SizedBox(height: 0.0),
                    (haveScores == true)
                        ? Column(
                            children: [createAllScores()],
                          )
                        : SizedBox(height: 0.0),
                    // createScore('JADAS','40/60'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "Ordonnance",
                            style: cyan20Bold,
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 15.0),
                            child: FlatButton(
                                autofocus: true,
                                focusColor: Colors.green,
                                splashColor: Colors.green,
                                highlightColor: Colors.green,
                                color: Colors.green,
                                child: Row(
                                  children: [
                                    Text(
                                      'Ajouter',
                                      style: GoogleFonts.oxygen(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Icon(
                                        FontAwesomeIcons.plusCircle,
                                        size: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: _isAddOrdonnanceButtonDisabled
                                    ? null
                                    : () {
                                        print(nbrCards);
                                        if (nbrCards == 4) {
                                          if (mounted == true) {
                                            setState(() {
                                              _isAddOrdonnanceButtonDisabled =
                                                  true;
                                            });
                                          }
                                        }
                                        if (nbrCards < 5) {
                                          if (this.mounted) {
                                            setState(() {
                                              nbrCards++;
                                              cardsOrdonnance.add(
                                                  createOrdonnance(
                                                      nbrCards - 1));
                                            });
                                          }
                                        }
                                      }),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: cardsOrdonnance,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 8.0, top: 15.0),
                            child: Text(
                              "Biologie",
                              style: cyan20Bold,
                            ),
                          ),
                        ),
                        flatButtonMultipleChoice(
                            title: 'bilan dos',
                            initValue: isChecked1,
                            onChanged: (newValue) {
                              if (this.mounted) {
                                setState(() {
                                  isChecked1 = newValue;
                                });
                              }
                            }),
                        flatButtonMultipleChoice(
                            title: 'bilan spinal cord',
                            initValue: isChecked2,
                            onChanged: (newValue) {
                              if (this.mounted) {
                                setState(() {
                                  isChecked2 = newValue;
                                });
                              }
                            }),
                      ],
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
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, HomeDoctor.routeName, (_) => false);
                            });
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
