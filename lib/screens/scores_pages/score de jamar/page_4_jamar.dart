import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class Page4Jamar extends StatefulWidget {
  @override
  _Page4JamarState createState() => _Page4JamarState();
}

class _Page4JamarState extends State<Page4Jamar> {
  bool testDemanded = true;
  var controllerMedicament = TextEditingController();
  var controllerEffetIndesirable = TextEditingController();

  List<String> question_23 = [];
  List<String> question_24 = [];

  int index_23 = 0;
  int index_24 = 0;

  bool absenceSymptomes = false;
  bool persistanceSymptomes = false;
  bool reapparitionDeSymptomes = false;
  //question 24
  bool netteAmelioration = false;
  bool petiteAmerlioration = false;
  bool stableSansChangement = false;
  bool unPeuMoinsBien = false;
  bool vraimentMoinsBien = false;
  bool medicamentsPourSoignerArthrie = false;
  //question 25
  bool anis = false;
  bool corticoSteroides = false;
  bool methrotrexate = false;
  bool sulfasalazine = false;
  bool cyclosporine = false;
  bool etanercept = false;
  bool infliximab = false;
  bool adalimumab = false;
  bool golimumab = false;
  bool certolizumab = false;
  bool abatacept = false;
  bool canakinumab = false;
  bool anakinra = false;
  bool rilonacept = false;
  bool tocllzumab = false;

  //question 26
  bool effetsIndesirables = false;
  // question 28
  bool fievre = false;
  bool mauxDeTete = false;
  bool eruptionCutanee = false;
  bool aphtes = false;
  bool gingivites = false;
  bool augmentationPulosite = false;
  bool gainDePoids = false;
  bool perteDePoids = false;
  bool sautesHumeur = false;
  bool troublesDeSomeil = false;
  bool douleursOuBruluresGastriques = false;
  bool nausees = false;
  bool vomissements = false;
  bool constipation = false;
  bool diarrhee = false;
  bool sellesNoiresOuSanglantes = false;
  bool sangDansLesUrines = false;
  bool gonflementHematonesDouleur = false;

  double intensiteDouleur = 0;

  List categories = <String>[
    "Absence complète de rémission",
    "Persistance de symptômes (activité persistante)",
    "Réapparition des syptômes après",
  ];

  double sommeScore = 0;
  double nbrOfItems = 0;
  List<int> allQuestionsAutresActivites = [];
  void calculEtEnvoiSomme() {
    // var contenuControllerMedicament = controllerMedicament.text;
    // var contenuControllerEffetIndesirable = controllerEffetIndesirable.text;
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
            "Score JAMAR     Page 4/6",
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
                                          "23. Comment jugez-vous l\'état actuel de la maladie de votre enfant "),
                                      flatButtonMultipleChoice(
                                        title:
                                            'Absence complète de symptômes (rémission)',
                                        initValue: absenceSymptomes,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              absenceSymptomes = newValue;
                                              if (absenceSymptomes == true) {
                                                persistanceSymptomes =
                                                    !newValue;
                                                reapparitionDeSymptomes =
                                                    !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title:
                                            'Psersistance des symptômes (activité persistante)',
                                        initValue: persistanceSymptomes,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              persistanceSymptomes = newValue;
                                              if (persistanceSymptomes ==
                                                  true) {
                                                absenceSymptomes = !newValue;
                                                reapparitionDeSymptomes =
                                                    !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title:
                                            'Réapparition de symptômes après une période d\'accalmie complète (rechute)',
                                        initValue: reapparitionDeSymptomes,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              reapparitionDeSymptomes =
                                                  newValue;
                                              if (reapparitionDeSymptomes ==
                                                  true) {
                                                absenceSymptomes = !newValue;
                                                persistanceSymptomes =
                                                    !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      questionChaq(
                                          "24. Par rapport à sa dernière visite, comment jugez-vous l\'évolution de sa maladie& "),
                                      flatButtonMultipleChoice(
                                        title: 'Nette amélioration',
                                        initValue: netteAmelioration,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              netteAmelioration = newValue;
                                              if (netteAmelioration == true) {
                                                petiteAmerlioration = !newValue;
                                                unPeuMoinsBien = !newValue;
                                                stableSansChangement =
                                                    !newValue;
                                                vraimentMoinsBien = !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Petite amélioration',
                                        initValue: petiteAmerlioration,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              petiteAmerlioration = newValue;
                                              if (petiteAmerlioration == true) {
                                                netteAmelioration = !newValue;
                                                unPeuMoinsBien = !newValue;
                                                stableSansChangement =
                                                    !newValue;
                                                vraimentMoinsBien = !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Stable / sans changement',
                                        initValue: stableSansChangement,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              stableSansChangement = newValue;
                                              if (stableSansChangement ==
                                                  true) {
                                                petiteAmerlioration = !newValue;
                                                unPeuMoinsBien = !newValue;
                                                netteAmelioration = !newValue;
                                                vraimentMoinsBien = !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Un peu moins bien',
                                        initValue: unPeuMoinsBien,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              unPeuMoinsBien = newValue;
                                              if (unPeuMoinsBien == true) {
                                                petiteAmerlioration = !newValue;
                                                netteAmelioration = !newValue;
                                                stableSansChangement =
                                                    !newValue;
                                                vraimentMoinsBien = !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Vraiment moins bien',
                                        initValue: vraimentMoinsBien,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              vraimentMoinsBien = newValue;
                                              if (vraimentMoinsBien == true) {
                                                petiteAmerlioration = !newValue;
                                                unPeuMoinsBien = !newValue;
                                                stableSansChangement =
                                                    !newValue;
                                                netteAmelioration = !newValue;
                                              }
                                            });
                                          }
                                        },
                                      ),
                                      questionChaq(
                                          "25. Votre enfant prend-t-il des médicaments pour soigner son srthrite ? "),
                                      flatButtonMultipleChoice(
                                        title: 'Non',
                                        initValue:
                                            !medicamentsPourSoignerArthrie,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              medicamentsPourSoignerArthrie =
                                                  !newValue;
                                              print(
                                                  medicamentsPourSoignerArthrie);
                                            });
                                          }
                                        },
                                      ),
                                      flatButtonMultipleChoice(
                                        title: 'Oui',
                                        initValue:
                                            medicamentsPourSoignerArthrie,
                                        onChanged: (newValue) {
                                          if (this.mounted) {
                                            setState(() {
                                              medicamentsPourSoignerArthrie =
                                                  newValue;
                                              print(
                                                  medicamentsPourSoignerArthrie);
                                            });
                                          }
                                        },
                                      ),
                                      medicamentsPourSoignerArthrie
                                          ? Column(
                                              children: [
                                                questionChaq(
                                                    "26. Quels médicaments prend votre enfant pour soigner son arthrite ? "),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'ANIS (ex. Ibuprofène, Naproxène, Diclofénac)',
                                                  initValue: anis,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        anis = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Cortico-stéroïdes (ex. Prednisone, Prednisonole)',
                                                  initValue: corticoSteroides,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        corticoSteroides =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Méthrotrexate (ex. Méthotrexate, Metoject)',
                                                  initValue: methrotrexate,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        methrotrexate =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Sulfasalazine (ex. Salazopyrine)',
                                                  initValue: sulfasalazine,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        sulfasalazine =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Cyclosporine (ex. Sandimmunneoral)',
                                                  initValue: cyclosporine,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        cyclosporine = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Etanercept (Enbrel)',
                                                  initValue: etanercept,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        etanercept = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Infliximab (Remicade)',
                                                  initValue: infliximab,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        infliximab = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Adalimumab (Humira)',
                                                  initValue: adalimumab,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        adalimumab = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Golimumab (Simponi)',
                                                  initValue: golimumab,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        golimumab = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Certolizumab (Cizia)',
                                                  initValue: certolizumab,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        certolizumab = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Abatacept',
                                                  initValue: abatacept,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        abatacept = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Anakinra (Kineret)',
                                                  initValue: anakinra,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        anakinra = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Canakinumab (Ilaris)',
                                                  initValue: canakinumab,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        canakinumab = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Rilonacept (Arclyst)',
                                                  initValue: rilonacept,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        rilonacept = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Tocllzumab (Actemra)',
                                                  initValue: tocllzumab,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        tocllzumab = newValue;
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
                                                  controllerMedicament,
                                                  'Medicament ',
                                                  Icon(FontAwesomeIcons.pills,
                                                      color: gris2, size: 25),
                                                ),
                                              ],
                                            )
                                          : SizedBox(
                                              height: 0,
                                            ),
                                      questionChaq(
                                          "27. Depuis sa dernière visite votre enfant a-t-il / elle eu des effets indésirables qui pourraient être causés par son traitement ? "),
                                      flatButtonMultipleChoice(
                                          title: 'Non',
                                          initValue: !effetsIndesirables,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                effetsIndesirables = !newValue;
                                                print(effetsIndesirables);
                                              });
                                            }
                                          }),
                                      flatButtonMultipleChoice(
                                          title: 'Oui',
                                          initValue: effetsIndesirables,
                                          onChanged: (newValue) {
                                            if (this.mounted) {
                                              setState(() {
                                                effetsIndesirables = newValue;
                                                print(effetsIndesirables);
                                              });
                                            }
                                          }),
                                      effetsIndesirables
                                          ? Column(
                                              children: [
                                                Align(
                                                    child: questionChaq(
                                                        "28. Indiquez les effets indésirables ? "),
                                                    alignment:
                                                        Alignment.centerLeft),
                                                flatButtonMultipleChoice(
                                                  title: 'Fièvre',
                                                  initValue: fievre,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        fievre = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Maux de tête',
                                                  initValue: mauxDeTete,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        mauxDeTete = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Eruption cutanée',
                                                  initValue: eruptionCutanee,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        eruptionCutanee =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Aphtes',
                                                  initValue: aphtes,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        aphtes = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Gingivites',
                                                  initValue: gingivites,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        gingivites = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Augmentation de la pilosité',
                                                  initValue:
                                                      augmentationPulosite,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        augmentationPulosite =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Gain de poids',
                                                  initValue: gainDePoids,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        gainDePoids = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Perte de poids',
                                                  initValue: perteDePoids,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        perteDePoids = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Sautes d\'humeur (excitation, dépression, anxiété)',
                                                  initValue: sautesHumeur,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        sautesHumeur = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Troubles de someil',
                                                  initValue: troublesDeSomeil,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        troublesDeSomeil =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Douleurs ou brûlures gastriques',
                                                  initValue:
                                                      douleursOuBruluresGastriques,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        douleursOuBruluresGastriques =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Nausées',
                                                  initValue: nausees,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        nausees = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Vomissement',
                                                  initValue: fievre,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        fievre = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Constipation',
                                                  initValue: constipation,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        constipation = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Diarrhée',
                                                  initValue: diarrhee,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        diarrhee = newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Selles noires ou sanglantes',
                                                  initValue:
                                                      sellesNoiresOuSanglantes,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        sellesNoiresOuSanglantes =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title: 'Sang dans les urines',
                                                  initValue: sangDansLesUrines,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        sangDansLesUrines =
                                                            newValue;
                                                      });
                                                    }
                                                  },
                                                ),
                                                flatButtonMultipleChoice(
                                                  title:
                                                      'Gonflement hématones (bleu), douleur, rougeur, etc.. au site d\'injection',
                                                  initValue:
                                                      gonflementHematonesDouleur,
                                                  onChanged: (newValue) {
                                                    if (this.mounted) {
                                                      setState(() {
                                                        gonflementHematonesDouleur =
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
                                                  controllerEffetIndesirable,
                                                  'Effet indésirable ',
                                                  Icon(FontAwesomeIcons.pills,
                                                      color: gris2, size: 25),
                                                ),
                                              ],
                                            )
                                          : SizedBox(height: 0),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: new FlatButton(
                                            minWidth: 60.0,
                                            onPressed: () {
                                              calculEtEnvoiSomme();
                                              // Navigator.of(context).pushNamed(
                                              //   Page5Jamar.routeName,
                                              //   // arguments: Chaq3Arguments(
                                              //   //     nbrOfItems: nbrOfItems,
                                              //   //     sommeScore: sommeScore)
                                              // );
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
                                            text: "", style: cyan18Bold1_6),
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
