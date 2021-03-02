import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhumatologie/services/auth.dart';
import 'package:rhumatologie/shared/constants.dart';
import 'package:rhumatologie/shared/loading.dart';
import 'package:rhumatologie/shared/theme_container.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  bool loading = false;
  String email = '';
  int age = 0;
  String password = '';
  String error = '';
  List<String> yourList = [
    'Omar Chaabouni',
    'Chaima Araibi',
    'Ahmed Bellaaj',
    'Yassine Chaker'
  ];
  String _currentDoctor = 'Yassine Chaker';

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
                setState(() => email = val);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Age de votre enfant',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            // validator: (val)=>val.isEmpty ? print('Entrez un email valide'):null,
            keyboardType: TextInputType.number,
            style: GoogleFonts.oxygen(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.cake,
                color: Colors.white,
              ),
              hintText: 'Entez votre age',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (val) {
              setState(() => age = int.parse(val));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildChooseDoctorTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Choisir docteur',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              padding: EdgeInsets.only(left: 44.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: DropdownButton(
                  dropdownColor: Color(0xFF4e6151),
                  isExpanded: true,
                  items: yourList.map(
                    (val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: GoogleFonts.oxygen(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  value: _currentDoctor,
                  onChanged: (value) {
                    setState(() {
                      _currentDoctor = value;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 18.0),
              child: Icon(
                Icons.medical_services,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ],
        ),
      ],
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
              setState(() => password = val);
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
            setState(() {
              loading = true;
            });
            dynamic result =
                await _auth.registerWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                error = 'Please enter a valid email';
                loading = false;
              });
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'S\'INSCRIRE',
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
              text: 'Vous avez déja un compte ? ',
              style: GoogleFonts.oxygen(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'S\'identifier',
              style: GoogleFonts.oxygen(
                color: Colors.white,
                fontSize: 18.0,
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
                              'S\'INSCRIRE',
                              style: GoogleFonts.oxygen(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            _buildEmailTF(),
                            SizedBox(height: 30.0),
                            _buildPasswordTF(),
                            SizedBox(height: 30.0),
                            _buildAgeTF(),
                            SizedBox(height: 30.0),
                            _buildChooseDoctorTF(),
                            _buildLoginBtn(),
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
