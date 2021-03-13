import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhumatologie/models/test_model.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/utils.dart';

class DetailsScore extends StatefulWidget {
  static const routeName = '/detail_score';

  @override
  _DetailsScoreState createState() => _DetailsScoreState();
}

class _DetailsScoreState extends State<DetailsScore> {
  @override
  Widget build(BuildContext context) {
    final TestModel score = ModalRoute.of(context).settings.arguments;
    // final String score="test";

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
              child: Icon(FontAwesomeIcons.infoCircle, size: 20),
            ),
            Text(
              "Détails du score " + score.title,
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
                        "Détails du score",
                        style: cyan20Bold,
                      ),
                    ),
                    detailScoreCard(context, "24-12-2020", "40/60"),
                    detailScoreCard(context, "05-02-2021", "36/60"),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ));
      }),
    );
  }
}
