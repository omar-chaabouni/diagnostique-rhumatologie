import 'package:flutter/material.dart';
import 'package:rhumatologie/screens/authenticate/sign_in_doctor.dart';
import 'package:rhumatologie/screens/authenticate/sign_in_patient.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    if (mounted == true) {
      setState(() => showSignIn = !showSignIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInPatient(toggleView: toggleView);
    } else {
      return SignInDoctor(toggleView: toggleView);
    }
  }
}
