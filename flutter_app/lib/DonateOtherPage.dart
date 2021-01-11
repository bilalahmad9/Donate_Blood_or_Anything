import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DonateSelect.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DonorsPage.dart';

class DonateotherScreen extends StatefulWidget {
  @override
  _DonateotherScreenState createState() => _DonateotherScreenState();
}

class _DonateotherScreenState extends State<DonateotherScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _name, _phone, _type, _quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: Drawer(
      //    child: MainDrawer(),
      //  ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50,),
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
              SizedBox(height: 30,),
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
              SizedBox(height: 20,),
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
                    _name = value;
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Donation Type',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Donation Type";
                  }else{
                    _name = value;
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Quantity of Donation',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter Donation Qantity ";
                  }else{
                    _name = value;
                  }
                },
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: Upload,
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
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => donate()));
                  },
                  padding: EdgeInsets.all(20.0),
                  color: Colors.red,
                  child: Text(
                      '                    BACK                   ',
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
      map ['_type'] = _type;
      map ['_quantity'] = _quantity;

      databaseReference.child(uploadId).set(map);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DonorContact()));
    }
  }
}
