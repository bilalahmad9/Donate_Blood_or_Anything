import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DonateSelect.dart';

class DonateBloodScreen extends StatefulWidget {
  @override
  _DonateBloodScreenState createState() => _DonateBloodScreenState();
}

class _DonateBloodScreenState extends State<DonateBloodScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _BloodGroup = TextEditingController();
  TextEditingController _Gander = TextEditingController();
  TextEditingController _City = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: Drawer(
      //  child: MainDrawer(),
      // ),
      body: SingleChildScrollView(
        child: Container(
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
                  color: Colors.deepPurpleAccent,
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phone,
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _BloodGroup,
                decoration: InputDecoration(
                  hintText: 'Enter Your Blood Group',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _Gander,
                decoration: InputDecoration(
                  hintText: 'Enter Your Gander',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _City,
                decoration: InputDecoration(
                  hintText: 'Enter Your City',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onChanged: (value) {
                  setState(() {});
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
                  onPressed: () {
                    Map<String, dynamic> data = {
                      "field1": _name.text,
                      "field2": _phone.text,
                      "field1": _BloodGroup.text,
                      "field2": _Gander.text,
                      "field5": _City.text
                    };
                    Firestore.instance.collection("Blood Data").add(data);
                    // Navigator.of(context).pushReplacement(
                    //    MaterialPageRoute(builder: (context) => DonorContact()));
                  },
                  padding: EdgeInsets.all(20.0),
                  color: Colors.deepPurpleAccent,
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
              /*  Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Phone Number',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Blood Group',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Gander',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Enter Your City',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushReplacement(
                    //    MaterialPageRoute(builder: (context) => DonorContact()));
                  },
                  padding: EdgeInsets.all(20.0),
                  color: Colors.deepPurpleAccent,
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
                  child: Text(
                      '                    BACK                    ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      )),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
