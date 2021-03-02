import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rhumatologie/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rhumatologie/services/auth.dart';
import 'models/app_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Oxygen'),
        home: Wrapper(),
      ),
    );
  }
}
