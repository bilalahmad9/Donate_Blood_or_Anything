import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginPage.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 150.0,
                  child: Image.asset('images/signupblood.JPG'),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {},
                //  onSaved: (value) => _email = value,
              ),
              SizedBox(height: 20,),
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
              SizedBox(height: 20,),
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
              Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: SignUp,
                    padding: EdgeInsets.all(15),
                    color: Colors.deepPurpleAccent,
                    child: Text(
                        '                    Register Now                    ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        )),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> SignUp() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        user.credential;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  LoginScreen(),
          ),
        );
      } catch (e) {
        print(e.message);
      }
    }
  }
}
