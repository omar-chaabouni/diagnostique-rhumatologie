import 'package:flutter/material.dart';
import 'package:rhumatologie/shared/constants.dart';

class LoadingScreenPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: gris1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 14,
        ),
        backgroundColor: cyan2,
      ),
      body: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Center(
            child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(cyan2),
        )),
      ),
    );
  }
}
