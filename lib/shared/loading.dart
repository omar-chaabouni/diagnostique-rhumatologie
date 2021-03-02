import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rhumatologie/shared/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // const Color blue1 = Color(0xFF73AEF5);
    // const Color blue2 = Color(0xFF61A4F1);
    // const Color blue3 = Color(0xFF478DE0);
    // const Color blue4 = Color(0xFF398AE5);

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [cyan1, cyan2, cyan3],
          stops: [0.0, 0.5, 1],
        ),
      ),
      child: Center(
        child: SpinKitFadingCircle(
          color: cyan3,
          size: 50.0,
        ),
      ),
    );
  }
}
