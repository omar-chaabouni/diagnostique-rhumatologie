import 'package:flutter/material.dart';
import 'package:rhumatologie/screens/wrapper.dart';
import 'package:rhumatologie/shared/constants.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) {
//     runApp(MyApp());
//   });
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Oxygen',
        highlightColor: cyan2,
        // canvasColor: Color(0xffddd6cd),
      ),
      home: Wrapper(),
      routes: {
        '/wrapper': (context) => Wrapper(),
      },
    );
    // );
  }
}
