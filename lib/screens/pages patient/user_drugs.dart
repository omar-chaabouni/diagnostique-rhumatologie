import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

// ignore: must_be_immutable
class UserDrugs extends StatefulWidget {
  Patient patient;
  String token;
  UserDrugs({this.patient, this.token});
  @override
  _UserDrugsState createState() => _UserDrugsState();
}

class _UserDrugsState extends State<UserDrugs> {
  int selectedIndex = 1;
  bool isChecked = false;
  bool bilans = false;
  bool medicaments = false;
  var drugsCards = <Card>[];
  var bilansCards = <Card>[];
  bool contact = false;
  bool mail = false;
  bool telephone = false;
  ScrollController scrollController = ScrollController();
  List<dynamic> listOfDrugs = [];

  List<dynamic> listOfBilans = [];
  @override
  void initState() {
    super.initState();

    if (widget.patient.bilan != null) {
      if (widget.patient.bilan.isNotEmpty) {
        if (widget.patient.bilan[0].typeBilan.isNotEmpty) {
          listOfBilans = widget.patient.bilan[0].typeBilan;
          print(listOfBilans);
        }
        if (listOfBilans.length > 0) {
          bilans = true;
        }
      }
    }
    if (widget.patient.ordonnance != null) {
      if (widget.patient.ordonnance.isNotEmpty) {
        for (int i = 0; i < widget.patient.ordonnance.length; i++) {
          if (widget.patient.ordonnance[i] != "") {
            listOfDrugs.add(widget.patient.ordonnance[i]);
          }
        }
        if (listOfDrugs.length > 0) {
          medicaments = true;
        }
      }
    }
    for (int i = 0; i < listOfDrugs.length; i++) {
      drugsCards.add(createPatientDrugCard(listOfDrugs[i]));
    }
    for (int i = 0; i < listOfBilans.length; i++) {
      bilansCards.add(createBilanPatientCard(listOfBilans[i]));
    }
    if ((widget.patient.docteur.mail != null) ||
        widget.patient.docteur.telephone != null) {
      contact = true;
    }
    if (widget.patient.docteur.telephone != null) {
      telephone = true;
    }
    if (widget.patient.docteur.mail != null) {
      mail = true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gris1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cyan2,
        title: FlatButton.icon(
          onPressed: null,
          icon: Icon(FontAwesomeIcons.userMd, color: Colors.white, size: 19.0),
          label: Text(
            " Acceuil",
            style: white20Bold,
          ),
        ),
      ),
      body: Scrollbar(
        radius: Radius.circular(15.0),
        isAlwaysShown: true,
        controller: scrollController,
        child: new SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: gris1,
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
                                      text:
                                          "${widget.patient.docteur.prenom} ${widget.patient.docteur.nom}",
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
                                  (!medicaments && !bilans)
                                      ? TextSpan(
                                          text: " n'a rien préscrit.",
                                          style: black18Normal,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      bilans
                          ? Container(
                              margin: EdgeInsets.only(
                                  bottom: 8.0,
                                  top: 8.0,
                                  right: 10.0,
                                  left: 10.0),
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
                      contact
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15.0, top: 10.0),
                                  child: Text(
                                    "Si vous voulez contacter votre médecin :",
                                    style: black18Normal,
                                  ),
                                ),
                                mail
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Icon(
                                                Icons.mail,
                                                color: cyan2,
                                                size: 18.0,
                                              ),
                                            ),
                                            Flexible(
                                              child: RichText(
                                                overflow: TextOverflow.visible,
                                                text: TextSpan(
                                                  text:
                                                      '${widget.patient.docteur.mail}',
                                                  style: cyan18Bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container,
                                telephone
                                    ? Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 24.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Icon(Icons.phone,
                                                  color: cyan2, size: 18.0),
                                            ),
                                            Text(
                                              "${widget.patient.docteur.telephone}",
                                              style: cyan18Bold,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
