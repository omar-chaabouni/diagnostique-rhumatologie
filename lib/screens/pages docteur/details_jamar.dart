import 'package:flutter/material.dart';
import 'package:rhumatologie/shared/constants.dart';

class DetailsJamar extends StatefulWidget {
  static const routeName = '/detail_jamar';

  @override
  _DetailsJamarState createState() => _DetailsJamarState();
}

class _DetailsJamarState extends State<DetailsJamar> {
  @override
  Widget build(BuildContext context) {
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
                child: Icon(Icons.info, size: 24),
              ),
              Text(
                "Détails du score JAMAR ",
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
                            "Détails du dernier score JAMAR",
                            style: cyan20Bold,
                          ),
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
