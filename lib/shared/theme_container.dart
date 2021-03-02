import 'package:flutter/material.dart';
import 'package:rhumatologie/shared/constants.dart';

// ignore: non_constant_identifier_names
ThemeContainer() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          cyan1,
          cyan2,
          cyan3,
        ],
        stops: [0.0, 0.5, 1],
      ),
    ),
  );
}
