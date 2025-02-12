import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/models/patient.dart';
import 'package:rhumatologie/screens/pages%20patient/home_patient.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/loading.dart';
import 'package:rhumatologie/shared/theme_container.dart';
import 'package:http/http.dart' as http;

class SignInPatient extends StatefulWidget {
  final Function toggleView;
  SignInPatient({this.toggleView});
  @override
  _SignInPatientState createState() => _SignInPatientState();
}

class _SignInPatientState extends State<SignInPatient> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';
  Patient patient;
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn(int telephone, String password) async {
    Doctor result;
    String loginURL = '$baseUrl/patients/login';
    String getPatientURL = '$baseUrl/patients/me';

    try {
      var loginResponse = await http.post("$loginURL",
          body: json.encode({"telephone": telephone, "password": password}),
          headers: {
            'Content-Type': 'application/json',
          });
      if (loginResponse.statusCode == 200) {
        var getPatientResponse = await http.get("$getPatientURL", headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${json.decode(loginResponse.body)["token"]}'
        });
        if (getPatientResponse.statusCode == 200) {
          patient =
              Patient.fromJson(json.decode(getPatientResponse.body)["patient"]);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePatient(
                  patient: patient,
                  token: json.decode(loginResponse.body)["token"])));
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Widget _buildTelephoneTF() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Téléphone',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              style: whiteNormal,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                hintText: 'Entez votre téléphone',
                hintStyle: kHintTextStyle,
              ),
              onChanged: (val) {
                if (mounted == true) {
                  setState(() => telephoneController.text = val);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mot de passe',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            onChanged: (val) {
              if (mounted == true) {
                setState(() => passwordController.text = val);
              }
            },
            obscureText: true,
            style: whiteNormal,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Entrez votre mot de passe',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            if (mounted == true) {
              setState(() {
                loading = true;
              });
            }
            dynamic result = await signIn(
                int.parse(telephoneController.text), passwordController.text);
            if (result == null) {
              if (mounted == true) {
                setState(() {
                  error = 'Could not sign in with those credentials';
                  loading = false;
                });
              }
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'S\' IDENTIFIER',
          style: cyan318Bold,
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => {widget.toggleView()},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Vous êtes un de nos docteurs ?\n',
              style: white15w400,
            ),
            TextSpan(
              text: 'S\' identifier en tant que docteur',
              style: white17Bold,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    ThemeContainer(),
                    Container(
                      // height: double.infinity,
                      child: SingleChildScrollView(
                        // physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 100.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'BIENVENUE PATIENT',
                              style: white26Bold,
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'S\' IDENTIFIER',
                              style: white22Bold,
                            ),
                            SizedBox(height: 30.0),
                            _buildTelephoneTF(),
                            SizedBox(
                              height: 30.0,
                            ),
                            _buildPasswordTF(),
                            SizedBox(height: 15.0),
                            _buildLoginBtn(),
                            SizedBox(height: 15.0),
                            _buildSignupBtn(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: new Container(
              color: cyan3,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Ce travail a été réalisé par Omar CHAABOUNI, Chaima ARAIBI et Ahmed BELLAAJ; sous l\'encadrement de Dr. Wided MILED',
                            style: white12Normal,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Délivré de l\' INSAT',
                          style: white12Normal,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8, right: 8, bottom: 2),
                          child: Image.asset('icons/flags/png/tn.png',
                              width: 20.0, package: 'country_icons'),
                        ),
                        Text(
                          '2021 \u00a9',
                          style: white12Normal,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // color: Colors.red,
          );
  }
}
