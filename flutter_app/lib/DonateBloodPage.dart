import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DonateSelect.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'DonorsPage.dart';

class DonateBloodScreen extends StatefulWidget {
  @override
  _DonateBloodScreenState createState() => _DonateBloodScreenState();
}

class _DonateBloodScreenState extends State<DonateBloodScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _name, _phone, _BloodGroup, _Gander, _City;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: Drawer(
      //  child: MainDrawer(),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  " Enter Your Record ",
                  style: GoogleFonts.acme(
                    textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
               validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Your Name";
                  }else{
                    _name = value;
                  }
               },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Your Phone Number";
                  }else{
                    _phone = value;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Blood Group',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Your Blood Group";
                  }else{
                    _BloodGroup = value;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Gander',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Your Gander";
                  }else{
                    _Gander = value;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your City',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Your City";
                  }else{
                    _City = value;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: Upload,
                   //  Navigator.of(context).pushReplacement(
                     //   MaterialPageRoute(builder: (context) => DonorContact()));
                  padding: EdgeInsets.all(20.0),
                  color: Colors.green,
                  child: Text(
                      '                    Submit Your Record                    ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => donate()));
                  },
                  padding: EdgeInsets.all(15.0),
                  color: Colors.red,
                  child: Text('                    BACK                    ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Upload() async {
    if (_formkey.currentState.validate()) {
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .reference().child("Data");
      String uploadId = databaseReference
          .push()
          .key;
      HashMap map = HashMap();
      map ['_name'] = _name;
      map ['_phone'] = _phone;
      map ['_BloodGroup'] = _BloodGroup;
      map ['_Gander'] = _Gander;
      map ['_City'] = _City;

      databaseReference.child(uploadId).set(map);
      Navigator.of(context).pushReplacement(
             MaterialPageRoute(builder: (context) => DonorContact()));
    }
  }
}
