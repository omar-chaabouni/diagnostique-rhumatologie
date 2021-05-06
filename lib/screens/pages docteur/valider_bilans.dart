import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/shared/constants.dart';

// ignore: must_be_immutable
class ValiderBilans extends StatefulWidget {
  static const routeName = '/valider_bilan';
  Patient patient;

  @override
  _ValiderBilansState createState() => _ValiderBilansState();
}

class _ValiderBilansState extends State<ValiderBilans> {
  var bilanCards = <Padding>[];
  DateFormat formatter;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.patient = ModalRoute.of(context).settings.arguments;
    createBilanCards();
    initializeDateFormatting('fr');
    formatter = DateFormat('d MMMM yyyy', 'fr');
  }

  createBilanCards() {
    // widget.patient.bilan[0].length
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
                child: Icon(FontAwesomeIcons.history, size: 20),
              ),
              Text(
                "Valider les bilans demandés ",
                style: white19Normal,
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
                                    text: patient.prenom + " " + patient.nom,
                                    style: black18Normal),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5),
                          child: RichText(
                            text: TextSpan(
                              text: "Date demandé : ",
                              style: black18Bold,
                              children: <TextSpan>[
                                TextSpan(
                                    // text: patient.bilan[0].dateDemande.toString(),
                                    text:
                                        "${formatter.format(patient.bilan[0].dateDemande)}",
                                    style: black18Normal),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5),
                          child: RichText(
                            text: TextSpan(
                              text: "Bilans : ",
                              style: black18Bold,
                            ),
                          ),
                        ),
                        Column(
                          children: bilanCards,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: new FlatButton(
                                onPressed: () {
                                  print("aaa");
                                },
                                focusColor: Colors.green,
                                hoverColor: Colors.green,
                                splashColor: Colors.green,
                                color: Colors.green,
                                child: Container(
                                  width: 115,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Valider test',
                                        style: white16Bold,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
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
                        ),
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
