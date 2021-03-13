import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/shared/constants.dart';

class Page1Jamar extends StatefulWidget {
  static const routeName = '/jamar_1';

  @override
  _Page1JamarState createState() => _Page1JamarState();
}

class _Page1JamarState extends State<Page1Jamar> {
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
            "Score JAMAR",
            style: white22Bold,
          ),
        ),
      ),
      body: Container(
        color: gris1,
        height: MediaQuery.of(context).size.height,
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
                            text: 'Score JAMAR ',
                            style: black18Normal,
                            children: <TextSpan>[
                              TextSpan(text: "Dr. ", style: cyan18Bold1_6),
                              TextSpan(
                                  text: "Hanene Lassoued Ferjani ",
                                  style: cyan18Bold1_6),
                              TextSpan(
                                  text: ' n\'a rien demandé pour le moment.')
                            ],
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
    );
  }
}
