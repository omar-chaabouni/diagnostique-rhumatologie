import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rhumatologie/shared/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
