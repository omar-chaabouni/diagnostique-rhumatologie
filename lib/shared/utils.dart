import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_1_chaq.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jadas/page_1_jadas.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_1_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jspada/page_1_jspada.dart';
import 'package:rhumatologie/shared/constants.dart';

FlatButton flatButtonMultipleChoice(
    {String title, bool initValue, Function(bool boolValue) onChanged}) {
  return FlatButton(
    autofocus: true,
    splashColor: Colors.white,
    highlightColor: Colors.white,
    onPressed: () {
      onChanged(!initValue);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Checkbox(
                value: initValue,
                onChanged: (b) {
                  onChanged(b);
                  // print(b.toString());
                }),
          ),
        ),
        SizedBox(width: 20.0),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(title, style: black18Normal),
        )),
      ],
    ),
  );
}

Card createBilanPatientCard(String insideText) {
  return Card(
    elevation: 0.0,
    margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 8,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 3.0, right: 8.0),
                            child: Icon(
                              FontAwesomeIcons.fileAlt,
                              size: 20.0,
                              color: cyan2,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: insideText,
                          style: black18Normal,
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
  );
}

Card questionCardTitle(String cardTitle) {
  return Card(
    color: cyan2,
    elevation: 0.0,
    margin: EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: cardTitle,
                          style: white19Bold,
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
  );
}

Card createPatientDrugCard(String text) {
  return Card(
    elevation: 0.0,
    margin: EdgeInsets.only(bottom: 12, right: 12.0, left: 12.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: cyan2, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    // elevation: 10,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 15.0, left: 5.0, bottom: 5.0),
                  child: Icon(
                    FontAwesomeIcons.pills,
                    size: 25.0,
                    color: cyan2,
                  ),
                ),
                Flexible(
                  child: Text(
                    text,
                    style: black18Normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Container addPatientTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 8.0),
      child: Text(
        title,
        style: cyan20Bold,
      ),
    ),
  );
}

Container textFormFieldTextWithoutValidator(
    TextEditingController theController, String hint, Icon iconTFFI) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.0, top: 8.0, right: 10.0, left: 10.0),
    padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 2.0),
    decoration: BoxDecoration(
      border: Border.all(color: cyan2, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: iconTFFI,
          hintText: hint,
          hintStyle: TextStyle(color: gris2, fontSize: 16.0),
        ),
        keyboardType: TextInputType.text,
        controller: theController,
        cursorColor: cyan2,
        style: black18Normal),
  );
}

Container textFormFieldText(
    TextEditingController theController, String hint, Icon iconTFFI) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.0, top: 8.0, right: 10.0, left: 10.0),
    padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 2.0),
    decoration: BoxDecoration(
      border: Border.all(color: cyan2, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Veuillez remplir ce champ';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: iconTFFI,
          hintText: hint,
          hintStyle: TextStyle(color: gris2, fontSize: 16.0),
        ),
        keyboardType: TextInputType.text,
        controller: theController,
        cursorColor: cyan2,
        style: black18Normal),
  );
}

Container textFormFieldNumber(
    TextEditingController theController, String hint, Icon iconTFFI) {
  return Container(
    margin: EdgeInsets.only(bottom: 8.0, top: 8.0, right: 10.0, left: 10.0),
    padding: EdgeInsets.only(right: 10.0, left: 10.0),
    decoration: BoxDecoration(
      border: Border.all(color: cyan2, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Veuillez remplir ce champ';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: iconTFFI,
          hintText: hint,
          hintStyle: TextStyle(color: gris2, fontSize: 16.0),
        ),
        keyboardType: TextInputType.number,
        controller: theController,
        cursorColor: cyan2,
        style: black18Normal),
  );
}

Padding questionChaq(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Card createRequestedScoreCard(
    String scoreType, BuildContext context, String nomPatient) {
  return Card(
    elevation: 0.0,
    margin: EdgeInsets.only(bottom: 0.0, top: 0.0),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 8,
      ),
      child: Container(
        margin: EdgeInsets.only(top: 8.0, right: 10.0, left: 10.0),
        padding:
            EdgeInsets.only(right: 12.0, left: 12.0, top: 6.0, bottom: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: cyan2, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 1.5, right: 8.0),
                          child: Icon(
                            FontAwesomeIcons.fileAlt,
                            size: 20.0,
                            color: cyan2,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: scoreType,
                        style: black18Normal,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, top: 0.0, bottom: 0.0),
                  child: new FlatButton(
                    // minWidth: 124.0,
                    onPressed: () {
                      switch (scoreType) {
                        case "JADAS":
                          return Navigator.of(context).pushNamed(
                              Page1Jadas.routeName,
                              arguments: nomPatient);
                          break;
                        case "JSPADA":
                          return Navigator.of(context).pushNamed(
                              Page1Jspada.routeName,
                              arguments: nomPatient);
                          break;
                        case "CHAQ":
                          return Navigator.of(context).pushNamed(
                              Page1Chaq.routeName,
                              arguments: nomPatient);
                          break;
                        case "JAMAR":
                          return Navigator.of(context).pushNamed(
                              Page1Jamar.routeName,
                              arguments: nomPatient);
                          break;
                        // default:
                        //   return Navigator.of(context).pushNamed(
                        //       Page1Jadas.routeName,
                        //       arguments: nomPatient);
                      }
                    },
                    focusColor: Colors.green,
                    hoverColor: Colors.green,
                    splashColor: Colors.green,
                    color: Colors.green,
                    child: Container(
                      width: 150,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Prendre le test',
                            style: GoogleFonts.oxygen(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(
                              FontAwesomeIcons.arrowAltCircleRight,
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
          ],
        ),
      ),
    ),
  );
}

Card historiqueCard(BuildContext context, String date, String resultat) {
  return Card(
    elevation: 0,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            margin: EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
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
                        text: "Date :  ",
                        style: black18Bold,
                        children: <TextSpan>[
                          TextSpan(text: date, style: black18Normal),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Résultat : ",
                        style: black18Bold,
                        children: <TextSpan>[
                          TextSpan(text: resultat, style: black18Normal),
                        ],
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
  );
}

Column detailScoreCard(BuildContext context, String date, String resultat) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          margin: EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
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
                      text: "Réalisé le :  ",
                      style: black18Bold,
                      children: <TextSpan>[
                        TextSpan(text: date, style: black18Normal),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Résultat : ",
                      style: black18Bold,
                      children: <TextSpan>[
                        TextSpan(text: resultat, style: black18Normal),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Text sliderLimit(double value) {
  return Text(
    "$value",
    style: black18Bold,
  );
}

Padding sliderLimitWithText(double value, String textDouleur) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
    child: Container(
      width: 50,
      child: Column(
        children: [
          Text(
            "$value",
            style: GoogleFonts.oxygen(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13.0),
          ),
          Text(
            "$textDouleur",
            style: GoogleFonts.oxygen(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 11.0),
          ),
        ],
      ),
    ),
  );
}

Padding elementProfile(String champ, String valeur) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: RichText(
      text: TextSpan(
        text: "$champ :  ",
        style: cyan20Bold,
        children: <TextSpan>[
          TextSpan(text: "$valeur", style: black18Bold),
          // TextSpan(
          //     text: ' vous a préscrit ces médicaments : '),
        ],
      ),
    ),
  );
}
