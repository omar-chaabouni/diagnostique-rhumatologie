import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/bilan.dart';
import 'package:rhumatologie/models/historique_arguments.dart';
import 'package:rhumatologie/models/jadas.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class HistoriqueScore extends StatefulWidget {
  static const routeName = '/historique_score';
  HistoriqueArguments historiqueArguments;

  @override
  _HistoriqueScoreState createState() => _HistoriqueScoreState();
}

class _HistoriqueScoreState extends State<HistoriqueScore> {
  var allHistoriqueCards = <Card>[];
  List<Jadas> testsJadas = [];
  // List <Jadas> tests=[]; //autres types
  // List <Jadas> tests=[];
  // List <Jadas> tests=[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.historiqueArguments = ModalRoute.of(context).settings.arguments;
    getHistorique();
    print(testsJadas);
    for (int i = 0; i < testsJadas.length; i++) {
      allHistoriqueCards.add(historiqueCard(
          context, testsJadas[i].dateDemande.toString(), "40/60"));
    }
  }

  void getHistorique() {
    if (widget.historiqueArguments.typeScore == 'JADAS') {
      testsJadas = widget.historiqueArguments.patient.jadas;
    }
  }

  @override
  Widget build(BuildContext context) {
    final HistoriqueArguments historiqueArguments =
        ModalRoute.of(context).settings.arguments;
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
                "Historique du score de " + historiqueArguments.typeScore,
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
                            "Historique du score",
                            style: cyan20Bold,
                          ),
                        ),
                        Column(
                          children: allHistoriqueCards,
                        ),
                        SizedBox(height: 40),
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
