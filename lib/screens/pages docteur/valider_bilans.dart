import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rhumatologie/shared/utils.dart';

// ignore: must_be_immutable
class ValiderBilans extends StatefulWidget {
  static const routeName = '/valider_bilan';
  Patient patient;
  Doctor doctor;
  String token;
  ValiderBilans({this.doctor, this.token, this.patient});
  @override
  _ValiderBilansState createState() => _ValiderBilansState();
}

class _ValiderBilansState extends State<ValiderBilans> {
  var bilanCards = <Padding>[];
  DateFormat formatter;
  bool dateDemandeBilan = false;
  bool existeBilan = false;
  @override
  void initState() {
    super.initState();
    createBilanCards();
    initializeDateFormatting('fr');
    formatter = DateFormat('d MMMM yyyy', 'fr');
    print("valider " + widget.patient.nom.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // widget.patient = ModalRoute.of(context).settings.arguments;
  }

  validerBilan() async {
    String validateBilanURL =
        'http://192.168.1.16:4000/doctors/${widget.doctor.id.toString()}/patients/${widget.patient.id.toString()}/validateBilan';
    try {
      var validateBilanResponse = await http.post("$validateBilanURL",
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${widget.token}'
          });
      Future.delayed(Duration(milliseconds: 1000), () {
        if (validateBilanResponse.statusCode == 200 ||
            validateBilanResponse.statusCode == 201 ||
            validateBilanResponse.statusCode == 202 ||
            validateBilanResponse.statusCode == 203) {
          enregistrerAvecSuccess(context);
          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeDoctor(
                doctor: widget.doctor,
                token: widget.token,
              ),
            ));
          });
        } else {
          Future.delayed(Duration(milliseconds: 1000), () {
            erreurEnregistrement(context);
          });
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  createBilanCards() {
    if (widget.patient.bilan.isNotEmpty) {
      if (widget.patient?.bilan[0]?.dateDemande != null) {
        dateDemandeBilan = true;
      }
      if (widget.patient.bilan.isNotEmpty) {
        existeBilan = true;
      }
      for (int i = 0; i < widget.patient.bilan[0].typeBilan.length; i++) {
        Padding nomBilan = Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_right,
                  size: 20.0,
                  color: Colors.black,
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: "${widget.patient.bilan[0].typeBilan[i]}",
                      style: black18Normal,
                    ),
                  ),
                ),
              ],
            ));
        bilanCards.add(nomBilan);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Patient patient = ModalRoute.of(context).settings.arguments;
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
                child: Icon(FontAwesomeIcons.history, size: 16),
              ),
              Text(
                "Valider les bilans demandés ",
                style: white16Normal,
              ),
            ],
          ),
        ),
        body: Builder(builder: (BuildContext context) {
          return new SingleChildScrollView(
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
                            "Valider les bilans du patient ",
                            style: cyan20Bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5),
                          child: RichText(
                            text: TextSpan(
                              text: "Patient : ",
                              style: black18Bold,
                              children: <TextSpan>[
                                TextSpan(
                                    text: widget.patient.prenom +
                                        " " +
                                        widget.patient.nom,
                                    style: black18Normal),
                              ],
                            ),
                          ),
                        ),
                        (dateDemandeBilan)
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 5),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Date demandé : ",
                                    style: black18Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          // text: patient.bilan[0].dateDemande.toString(),
                                          text:
                                              "${formatter.format(widget.patient.bilan[0].dateDemande)}",
                                          style: black18Normal),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        !existeBilan
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 5),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Aucun bilan à afficher ! ",
                                    style: black18Bold,
                                  ),
                                ),
                              )
                            : Container(),
                        existeBilan
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 5),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Bilans : ",
                                    style: black18Bold,
                                  ),
                                ),
                              )
                            : Container(),
                        Column(
                          children: bilanCards,
                        ),
                        existeBilan
                            ? Row(
                                children: [
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: new FlatButton(
                                      onPressed: () {
                                        validerBilan();
                                      },
                                      focusColor: Colors.green,
                                      hoverColor: Colors.green,
                                      splashColor: Colors.green,
                                      color: Colors.green,
                                      child: Container(
                                        // width: 115,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'Valider bilans',
                                              style: white16Bold,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6.0),
                                              child: Icon(
                                                FontAwesomeIcons.checkCircle,
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
                              )
                            : Container(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
