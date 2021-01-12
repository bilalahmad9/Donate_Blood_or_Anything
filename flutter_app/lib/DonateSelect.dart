import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/OtherDonorPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DonateBloodPage.dart';
import 'DonateOtherPage.dart';
import 'DonorsPage.dart';

class donate extends StatefulWidget {
  @override
  _donateState createState() => _donateState();
}

class _donateState extends State<donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  drawer: Drawer(
        child: MainDrawer(),
      ),*/
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(
              "images/welcome.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.white.withOpacity(0.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          " Donate Or Recepient",
                          style: GoogleFonts.acme(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(10.0)),
                            SizedBox(height: 1,),
                            RaisedButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                   MaterialPageRoute(builder: (context) => DonateBloodScreen()));
                              },
                              child: Container(
                                height: 200,
                                width: 150,
                                color: Colors.red,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 80),
                                child: Text(
                                  " Donate Blood",
                                  style: GoogleFonts.acme(
                                    textStyle:
                                    Theme.of(context).textTheme.display1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                //child: Image.asset("images/donor.png", height: 100, width: 100,),
                              ),

                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RaisedButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => DonateotherScreen()));
                              },
                              child: Container(
                                height: 200,
                                width: 150,
                                color: Colors.red,
                                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 70),
                                child: Text(
                                  " Donate Other thing",
                                  style: GoogleFonts.acme(
                                    textStyle:
                                    Theme.of(context).textTheme.display1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text("Contact with", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),),
                      ),
                      SizedBox(height: 20,),
                      Row(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(10.0)),
                            SizedBox(height: 1,),
                            RaisedButton(
                              padding: const EdgeInsets.all(15.0),
                              color: Colors.green,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => DonorContact()));
                              },
                              child: Container(
                                child: Text(
                                  " Blood Donors",
                                  style: GoogleFonts.acme(
                                    textStyle:
                                    Theme.of(context).textTheme.display1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            RaisedButton(
                              padding: const EdgeInsets.all(15.0),
                              color: Colors.green,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => OtherDonorData()));
                              },
                              child: Container(
                                child: Text(
                                  " Other Donors",
                                  style: GoogleFonts.acme(
                                    textStyle:
                                    Theme.of(context).textTheme.display1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                            ),
                          ],
                        ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
