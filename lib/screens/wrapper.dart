import 'package:flutter/material.dart';
import 'package:rhumatologie/screens/authenticate/authenticate.dart';
import 'package:rhumatologie/screens/authenticate/sign_in_doctor.dart';
// import 'package:provider/provider.dart';
// import 'package:rhumatologie/models/app_user.dart';
// import 'package:rhumatologie/screens/authenticate/authenticate.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';
// import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AppUser>(context);
    //return either home or authenticate widget
    // if (user == null) {
    //   return Authenticate();
    // } else {
    return Authenticate();
    // }
  }
}
