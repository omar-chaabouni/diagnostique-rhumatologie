import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
import 'package:rhumatologie/screens/pages%20docteur/details_score.dart';
import 'package:rhumatologie/screens/pages%20docteur/edit_user_prescription.dart';
import 'package:rhumatologie/screens/pages%20docteur/historique_score.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_1_chaq.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jadas/page_1_jadas.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_1_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jsrada/page_1_jsrada.dart';
import 'package:rhumatologie/screens/wrapper.dart';

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
    return
        // StreamProvider<AppUser>.value(
        //   value: AuthService().user,
        // child:
        MaterialApp(
      theme: ThemeData(fontFamily: 'Oxygen'),
      home: Wrapper(),
      routes: {
        EditUserPrescription.routeName: (ctx) => EditUserPrescription(),
        "/back_home_doctor": (_) => new HomeDoctor(),
        DetailsScore.routeName: (context) => DetailsScore(),
        HistoriqueScore.routeName: (context) => HistoriqueScore(),
        Page1Chaq.routeName: (context) => Page1Chaq(),
        Page1Jadas.routeName: (context) => Page1Jadas(),
        Page1Jamar.routeName: (context) => Page1Jamar(),
        Page1Jsrada.routeName: (context) => Page1Jsrada(),
      },
    );
    // );
  }
}
