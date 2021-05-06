import 'package:flutter/material.dart';
import 'package:rhumatologie/screens/pages%20docteur/details_jamar.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
import 'package:rhumatologie/screens/pages%20docteur/details_score.dart';
import 'package:rhumatologie/screens/pages%20docteur/edit_user_prescription.dart';
import 'package:rhumatologie/screens/pages%20docteur/historique_score.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/screens/pages%20docteur/valider_bilans.dart';
import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';
import 'package:rhumatologie/screens/pages%20patient/user_drugs.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_1_chaq.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_2_chaq.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_3_chaq.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20chaq/page_4_chaq.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jadas/page_1_jadas.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_1_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_2_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_3_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_4_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_5_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jamar/page_6_jamar.dart';
import 'package:rhumatologie/screens/scores_pages/score%20de%20jspada/page_1_jspada.dart';
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
        HomeDoctor.routeName: (_) => new HomeDoctor(),
        HomePatient.routeName: (_) => new HomePatient(),
        UserDrugs.routeName: (context) => UserDrugs(),
        DetailsScore.routeName: (context) => DetailsScore(),
        DetailsJamar.routeName: (context) => DetailsJamar(),
        HistoriqueScore.routeName: (context) => HistoriqueScore(),
        ValiderBilans.routeName: (context) => ValiderBilans(),
        Page1Chaq.routeName: (context) => Page1Chaq(),
        Page2Chaq.routeName: (context) => Page2Chaq(),
        Page3Chaq.routeName: (context) => Page3Chaq(),
        Page4Chaq.routeName: (context) => Page4Chaq(),
        Page1Jadas.routeName: (context) => Page1Jadas(),
        Page1Jamar.routeName: (context) => Page1Jamar(),
        Page2Jamar.routeName: (context) => Page2Jamar(),
        Page3Jamar.routeName: (context) => Page3Jamar(),
        Page4Jamar.routeName: (context) => Page4Jamar(),
        Page5Jamar.routeName: (context) => Page5Jamar(),
        Page6Jamar.routeName: (context) => Page6Jamar(),
        Page1Jspada.routeName: (context) => Page1Jspada(),
      },
    );
    // );
  }
}
