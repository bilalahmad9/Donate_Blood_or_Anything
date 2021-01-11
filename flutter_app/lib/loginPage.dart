import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'DonateSelect.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 150.0,
                child: Image.asset('images/bloodpic.PNG'),
              ),
            ),
            Center(
              child: Card(
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value,
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty || value.length <= 4) {
                              return 'please enter more than 4 words';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                        ),
                        SizedBox(height: 20,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: LogIn,
                          padding: EdgeInsets.all(15),
                          color: Colors.purpleAccent,
                          child: Text('                    Log In                    ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                        ),
                        SizedBox(height: 20,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                             Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                          },
                          padding: EdgeInsets.all(12),
                          color: Colors.deepPurpleAccent,
                          child: Text('       Register Now     ',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 70,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> LogIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  donate(),
          ),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }

}
