import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class donate extends StatefulWidget {
  @override
  _donateState createState() => _donateState();
}

class _donateState extends State<donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          " Select Donor Type ",
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
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
                        height: 150,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          " Donate Or Recepient",
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
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(10.0)),
                            SizedBox(height: 1,),
                            RaisedButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: () {
                               // Navigator.of(context).pushReplacement(
                                //    MaterialPageRoute(builder: (context) => DonateBloodScreen()));
                              },
                              child: Container(
                                height: 200,
                                width: 150,
                                color: Colors.purpleAccent,
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  " Donate Blood",
                                  style: GoogleFonts.acme(
                                    textStyle:
                                    Theme.of(context).textTheme.display1,
                                    fontSize: 40,
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
                              //  Navigator.of(context).pushReplacement(
                              //      MaterialPageRoute(builder: (context) => DonateotherScreen()));
                              },
                              child: Container(
                                height: 200,
                                width: 150,
                                color: Colors.purpleAccent,
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  " Donate Other thing",
                                  style: GoogleFonts.acme(
                                    textStyle:
                                    Theme.of(context).textTheme.display1,
                                    fontSize: 35,
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                           // Navigator.of(context).pushReplacement(
                            //    MaterialPageRoute(builder: (context) => DonorContact()));
                          },
                          padding: EdgeInsets.all(15),
                          color: Colors.deepPurpleAccent,
                          child: Text(
                              '                    Contact with Donor                    ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                        ),
                      ),
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
