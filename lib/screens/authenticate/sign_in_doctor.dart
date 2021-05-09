import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/models/doctor.dart';
import 'package:rhumatologie/screens/pages%20docteur/home_doctor.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/loading.dart';
import 'package:rhumatologie/shared/theme_container.dart';
import 'package:http/http.dart' as http;

class SignInDoctor extends StatefulWidget {
  final Function toggleView;
  SignInDoctor({this.toggleView});
  @override
  _SignInDoctorState createState() => _SignInDoctorState();
}

class _SignInDoctorState extends State<SignInDoctor> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // text field state
  bool loading = false;
  // String email = '';
  // String password = '';
  String error = '';
  Doctor doctor;

  signIn(String email, String password) async {
    Doctor result;
    String loginURL = 'http://192.168.1.16:4000/doctors/login';
    String getDoctorURL = 'http://192.168.1.16:4000/doctors/me';

    try {
      // print(json.encode({"mail": email, "password": password}));
      var loginResponse = await http.post("$loginURL",
          body: json.encode({"mail": email, "password": password}),
          headers: {
            'Content-Type': 'application/json',
          });
      // print(loginResponse.body.toString());
      if (loginResponse.statusCode == 200) {
        var getDoctorResponse = await http.get("$getDoctorURL", headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${json.decode(loginResponse.body)["token"]}'
        });
        if (getDoctorResponse.statusCode == 200) {
          // print(getDoctorResponse.body.toString());
          doctor = Doctor.fromRawJson(getDoctorResponse.body);
          print(doctor.toJson());

          // Navigator.of(context).pushNamed(HomeDoctor.routeName,
          //     arguments: DoctorLoginArguments(
          //         doctor: doctor,
          //         token: json.decode(loginResponse.body)["token"]));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeDoctor(
                  doctor: doctor,
                  token: json.decode(loginResponse.body)["token"])));
        }

        // if (mounted == true) {
        //   setState(() {
        //     // filteredPatients = patientList;
        //   });
        // }
      }
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // @override
  // Widget build(BuildContext context) {
  //   return loading
  //       ? Loading()
  //       : Scaffold(
  //           body: Padding(
  //               padding: EdgeInsets.all(10),
  //               child: ListView(
  //                 children: <Widget>[
  //                   Container(
  //                       alignment: Alignment.center,
  //                       padding: EdgeInsets.all(10),
  //                       child: Text(
  //                         'TutorialKart',
  //                         style: TextStyle(
  //                             color: Colors.blue,
  //                             fontWeight: FontWeight.w500,
  //                             fontSize: 30),
  //                       )),
  //                   Container(
  //                       alignment: Alignment.center,
  //                       padding: EdgeInsets.all(10),
  //                       child: Text(
  //                         'Sign in',
  //                         style: TextStyle(fontSize: 20),
  //                       )),
  //                   Container(
  //                     padding: EdgeInsets.all(10),
  //                     child: TextField(
  //                       controller: emailController,
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(),
  //                         labelText: 'User Name',
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
  //                     child: TextField(
  //                       obscureText: true,
  //                       controller: passwordController,
  //                       decoration: InputDecoration(
  //                         border: OutlineInputBorder(),
  //                         labelText: 'Password',
  //                       ),
  //                     ),
  //                   ),
  //                   FlatButton(
  //                     onPressed: () {
  //                       //forgot password screen
  //                     },
  //                     textColor: Colors.blue,
  //                     child: Text('Forgot Password'),
  //                   ),
  //                   Container(
  //                       height: 50,
  //                       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                       child: RaisedButton(
  //                         textColor: Colors.white,
  //                         color: Colors.blue,
  //                         child: Text('Login'),
  //                         onPressed: () {
  //                           // print(emailController.text);
  //                           // print(passwordController.text);
  //                           dynamic result = signIn(
  //                               emailController.text, passwordController.text);
  //                           // dynamic result =
  //                           //     await _auth.signInWithEmailAndPassword(email, password);
  //                           if (result == null) {
  //                             if (mounted == true) {
  //                               setState(() {
  //                                 error =
  //                                     'Could not sign in with those credentials';
  //                                 loading = false;
  //                               });
  //                             }
  //                           }
  //                         },
  //                       )),
  //                   Container(
  //                       child: Row(
  //                     children: <Widget>[
  //                       Text('Does not have account?'),
  //                       FlatButton(
  //                         textColor: Colors.blue,
  //                         child: Text(
  //                           'Sign in',
  //                           style: TextStyle(fontSize: 20),
  //                         ),
  //                         onPressed: () {
  //                           //signup screen
  //                         },
  //                       )
  //                     ],
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                   ))
  //                 ],
  //               )));
  // }

  Widget _buildEmailTF() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
              // validator: (val)=>val.isEmpty ? print('Entrez un email valide'):null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.oxygen(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Entez votre email',
                hintStyle: kHintTextStyle,
              ),
              onChanged: (val) {
                if (mounted == true) {
                  setState(() => emailController.text = val);
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
            // validator: (val)=>val.length<6 ? 'Le mot de passe doit contenir au moins 6 caractères':null,
            onChanged: (val) {
              if (mounted == true) {
                setState(() => passwordController.text = val);
              }
            },
            obscureText: true,
            style: GoogleFonts.oxygen(
              color: Colors.white,
            ),
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
            dynamic result =
                await signIn(emailController.text, passwordController.text);
            // dynamic result =
            //     await _auth.signInWithEmailAndPassword(email, password);
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
          style: GoogleFonts.oxygen(
            color: cyan3,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
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
              text: 'Vous êtes un de nos patient ?\n',
              style: GoogleFonts.oxygen(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'S\' identifier en tant que patient',
              style: GoogleFonts.oxygen(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
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
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 100.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'BIENVENU DOCTEUR',
                              style: GoogleFonts.oxygen(
                                color: Colors.white,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'S\' IDENTIFIER',
                              style: GoogleFonts.oxygen(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            _buildEmailTF(),
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
          );
  }
}
