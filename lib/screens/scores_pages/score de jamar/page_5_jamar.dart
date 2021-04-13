import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_6_jamar.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page5Jamar extends StatefulWidget {
  static const routeName = '/jamar_5';

  @override
  _Page5JamarState createState() => _Page5JamarState();
}

class _Page5JamarState extends State<Page5Jamar> {
  bool testDemanded = true;
  var controllerMedicament = TextEditingController();
  var controllerNePrendPadDeMedicament = TextEditingController();
  var controllerMedicamentDifficileAAdministrerRegulierement =
      TextEditingController();
  var controllerDifficultesMilieuScolaire = TextEditingController();

  List<String> question_23 = [];
  List<String> question_24 = [];

  int index_23 = 0;
  int index_24 = 0;
//question 30
  bool prendMedicamentsRegulierement = false;
  bool ilElleRefuse = false;
  bool problemeOrganisation = false;
  bool monEnfantPrendTropDeMedicaments = false;
  bool desAdminstartionsTropNombreuses = false;
  bool laPeurDesEffetsSecondaires = false;
//question 32
  bool pasDeProblemes = false;
  bool deNombreusesAbseneces = false;
  bool difficulteAResterAssis = false;
  bool difficultesDansSesRelationAvecLesEnseignants = false;
  bool basseDesResultatsScolaires = false;

  double sommeScore = 0;
  double nbrOfItems = 0;
  List<int> allQuestionsAutresActivites = [];
  void calculEtEnvoiSomme() {
    var contenuControllerMedicament = controllerMedicament.text;
    var contenuControllerNePrendPadDeMedicament =
        controllerNePrendPadDeMedicament.text;
    var contenuControllerMedicamentDifficileAAdministrerRegulierement =
        controllerMedicamentDifficileAAdministrerRegulierement.text;
    var contenuControllerDifficultesMilieuScolaire =
        controllerDifficultesMilieuScolaire.text;

    // allQuestionsAutresActivites
    //     .addAll([index_9, index_10, index_11, index_12, index_13, index_14]);
    // allQuestionsAutresActivites.removeWhere((item) => item == 4);
    // nbrOfItems += allQuestionsAutresActivites.length;

    // sommeScore += allQuestionsAutresActivites.reduce(max);
    // print("nbrOfItems " + nbrOfItems.toString());
    // print("sommeScore " + sommeScore.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: (null),
          icon: Icon(FontAwesomeIcons.fileAlt, color: Colors.white),
          label: Text(
            "Score JAMAR     Page 5/6",
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: testDemanded
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      questionChaq(
                                          "29. Votre enfant prend-il de façon régulière ses médicaments (tel que préscrit par le médecin) à la maison ?"),
                                      flatButtonMultipleChoice(
                                        title: 'Non',
                                        initValue:
                                            !prendMedicamentsRegulierement,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              prendMedicamentsRegulierement =
                                                  !newValue;
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Oui',
                                        initValue:
                                            prendMedicamentsRegulierement,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              prendMedicamentsRegulierement =
                                                  newValue;
                                            });
                                          }
                                        },
                                      ),
                                      prendMedicamentsRegulierement
                                          ? Column(
                                              children: [
                                                questionChaq(
                                                    "30. Pourquoi vote enfant ne prend-t-il pas ses médicaments régulièrement ? "),
                                                flatButtonMultipleChoice(
                                                  title: 'Il / Elle refuse',
                                                  initValue: ilElleRefuse,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        ilElleRefuse = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Problème d\'organisation (par exemple, difficulté de prendre les médicaments à l\'école',
                                                  initValue:
                                                      problemeOrganisation,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        problemeOrganisation =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Mon enfant prend trop de médicaments',
                                                  initValue:
                                                      monEnfantPrendTropDeMedicaments,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        monEnfantPrendTropDeMedicaments =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Des administrations trop nombreuses dans la journée',
                                                  initValue:
                                                      desAdminstartionsTropNombreuses,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        desAdminstartionsTropNombreuses =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'La peur des effets secondaires',
                                                  initValue:
                                                      laPeurDesEffetsSecondaires,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        laPeurDesEffetsSecondaires =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                Align(
                                                    child:
                                                        questionChaq("Sinon"),
                                                    alignment:
                                                        Alignment.centerLeft),
                                                textFormFieldText(
                                                  controllerNePrendPadDeMedicament,
                                                  'Autre cause ',
                                                  Icon(FontAwesomeIcons.pills,
                                                      color: gris2, size: 25),
                                                ),
                                              ],
                                            )
                                          : SizedBox(height: 0),
                                      questionChaq(
                                          "31. Quel médicament est le plus difficile à administrer de façon régulière ? "),
                                      textFormFieldText(
                                        controllerMedicamentDifficileAAdministrerRegulierement,
                                        'Medicament difficile à administrer',
                                        Icon(FontAwesomeIcons.pills,
                                            color: gris2, size: 25),
                                      ),
                                      questionChaq(
                                          "32. Quels sont les problèmes qu\'il / elle rencontre en mileu scolaire à cause de la maladie ?  ? "),
                                      flatButtonMultipleChoice(
                                        title: 'Pas de problèmes',
                                        initValue: pasDeProblemes,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              pasDeProblemes = newValue;
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'De nombreuses absences',
                                        initValue: deNombreusesAbseneces,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              deNombreusesAbseneces = newValue;
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title:
                                            'Difficulté à rester assis pendant une longue période',
                                        initValue: difficulteAResterAssis,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              difficulteAResterAssis = newValue;
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title:
                                            'Difficulté dans ses relations avec les enseignants',
                                        initValue:
                                            difficultesDansSesRelationAvecLesEnseignants,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              difficultesDansSesRelationAvecLesEnseignants =
                                                  newValue;
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Basse des résultats scolaires',
                                        initValue: basseDesResultatsScolaires,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              basseDesResultatsScolaires =
                                                  newValue;
                                            });
                                          }
                                        },
                                      ),
                                      Align(
                                          child: questionChaq("Sinon"),
                                          alignment: Alignment.centerLeft),
                                      textFormFieldText(
                                        controllerDifficultesMilieuScolaire,
                                        'Difficulté en milieu scolaire ',
                                        Icon(FontAwesomeIcons.school,
                                            color: gris2, size: 20),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: new FlatButton(
                                            minWidth: 60.0,
                                            onPressed: () {
                                              calculEtEnvoiSomme();
                                              Navigator.of(context).pushNamed(
                                                Page6Jamar.routeName,
                                                // arguments: Chaq3Arguments(
                                                //     nbrOfItems: nbrOfItems,
                                                //     sommeScore: sommeScore)
                                              );
                                            },
                                            focusColor: cyan2,
                                            hoverColor: cyan2,
                                            splashColor: cyan2,
                                            color: cyan2,
                                            child: Container(
                                              width: 145,
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Page suivante',
                                                    style: white16Bold,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12.0),
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .arrowAltCircleRight,
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
                                  )
                                : RichText(
                                    text: TextSpan(
                                      text: 'Score CHAQ ',
                                      style: black18Normal,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "Dr. ", style: cyan18Bold1_6),
                                        TextSpan(
                                            text: "Hanene Lassoued Ferjani ",
                                            style: cyan18Bold1_6),
                                        TextSpan(
                                            text:
                                                ' n\'a rien demandé pour le moment.')
                                      ],
                                    ),
                                  ),
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
