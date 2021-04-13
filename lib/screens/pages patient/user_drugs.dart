import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';
import 'package:http/http.dart' as http;

class UserDrugs extends StatefulWidget {
  static const routeName = '/user_drugs';
  @override
  _UserDrugsState createState() => _UserDrugsState();
}

class _UserDrugsState extends State<UserDrugs> {
  int selectedIndex = 1;
  bool isChecked = false;
  bool bilans = true;
  bool medicaments = true;
  var drugsCards = <Card>[];
  var bilansCards = <Card>[];
  // List<Patient> patientList = [];
  List<String> listOfDrugs = [
    "test",
    "doliprane 5fois par jour 4 jours par semaine 3 semaines",
    "test médicament",
  ];
  List<String> listOfBilans = [
    "Bilan test numero 1, bilan sur le dos spinal cord",
    "bilan spinal cord",
    "troisième bilan",
  ];

  // _getUserApi() async {
  //   String operationsURL = 'http://192.168.1.107:4000/patients';
  //   try {
  //     var operationResponse = await http.get("$operationsURL");
  //     if (operationResponse.statusCode == 200) {
  //       patientList = Patient.patientFromJson(operationResponse.body);
  //       print('test');
  //       print(patientList[0].nom);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  void initState() {
    // _getUserApi();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (int i = 0; i < listOfDrugs.length; i++) {
      drugsCards.add(createPatientDrugCard(listOfDrugs[i]));
    }
    for (int i = 0; i < listOfBilans.length; i++) {
      bilansCards.add(createBilanPatientCard(listOfBilans[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: gris1,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Icon(FontAwesomeIcons.userMd, color: Colors.white),
          label: Text(
            " Antécédent médical",
            style: white22Bold,
          ),
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          color: gris1,
          // height: MediaQuery.of(context).size.height,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Votre docteur ',
                              style: black18Normal,
                              children: <TextSpan>[
                                TextSpan(text: "Dr. ", style: cyan18Bold1_6),
                                TextSpan(
                                    text: "Hanene Lassoued Ferjani ",
                                    style: cyan18Bold1_6),
                                bilans
                                    ? TextSpan(
                                        text:
                                            ' vous demande de faire ces bilans :')
                                    : TextSpan(text: ''),
                                (!bilans && medicaments)
                                    ? TextSpan(
                                        text:
                                            " vous a préscrit ces médicaments : ")
                                    : TextSpan(text: ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    bilans
                        ? Container(
                            margin: EdgeInsets.only(
                                bottom: 8.0, top: 8.0, right: 10.0, left: 10.0),
                            padding: EdgeInsets.only(right: 10.0, left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: cyan2, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Column(
                              children: bilansCards,
                            ),
                          )
                        : SizedBox(height: 0),
                    (bilans && medicaments)
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text:
                                        'et vous a préscrit ces médicaments : ',
                                    style: black18Normal,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(height: 0),
                    SizedBox(height: 15.0),
                    medicaments
                        ? Column(
                            children: drugsCards,
                          )
                        : SizedBox(height: 0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0, top: 10.0),
                      child: Text(
                        "Si vous voulez contacter votre médecin :",
                        style: black18Normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.mail,
                              color: cyan2,
                              size: 18.0,
                            ),
                          ),
                          Text(
                            "docteurdocteurdocteur@gmail.com",
                            style: cyan18Bold,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.phone, color: cyan2, size: 18.0),
                          ),
                          Text(
                            "+216 58205495",
                            style: cyan18Bold,
                          ),
                        ],
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

// class Patient {
//   static List<Patient> patientFromJson(String operationsJson) =>
//       List<Patient>.from(
//           json.decode(operationsJson).map((x) => Patient.fromJson(x)));

//   Patient({
//     this.id,
//     this.nom,
//     this.prenom,
//     this.telephone,
//     this.numDossier,
//     this.diagnostic,
//     this.ordonnance,
//     this.jadas,
//     this.v,
//   });

//   String id;
//   String nom;
//   String prenom;
//   int telephone;
//   int numDossier;
//   String diagnostic;
//   String ordonnance;
//   List<Jada> jadas;
//   int v;

//   factory Patient.fromJson(Map<String, dynamic> json) => Patient(
//         id: json["_id"],
//         nom: json["nom"],
//         prenom: json["prenom"],
//         telephone: json["telephone"],
//         numDossier: json["num_dossier"],
//         diagnostic: json["diagnostic"],
//         ordonnance: json["ordonnance"],
//         jadas: List<Jada>.from(json["JADAS"].map((x) => Jada.fromJson(x))),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "nom": nom,
//         "prenom": prenom,
//         "telephone": telephone,
//         "num_dossier": numDossier,
//         "diagnostic": diagnostic,
//         "ordonnance": ordonnance,
//         "JADAS": List<dynamic>.from(jadas.map((x) => x.toJson())),
//         "__v": v,
//       };
// }

// class Jada {
//   Jada({
//     this.id,
//     this.score,
//     this.date,
//     this.state,
//   });

//   String id;
//   int score;
//   DateTime date;
//   int state;

//   factory Jada.fromJson(Map<String, dynamic> json) => Jada(
//         id: json["_id"],
//         score: json["score"],
//         date: DateTime.parse(json["date"]),
//         state: json["state"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "score": score,
//         "date": date.toIso8601String(),
//         "state": state,
//       };
// }
