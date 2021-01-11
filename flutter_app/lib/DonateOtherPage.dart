import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonateotherScreen extends StatefulWidget {
  @override
  _DonateotherScreenState createState() => _DonateotherScreenState();
}

class _DonateotherScreenState extends State<DonateotherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          " Other Donation Record ",
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
    //  drawer: Drawer(
    //    child: MainDrawer(),
    //  ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(
              "images/donation.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.white.withOpacity(0.8),
            padding: EdgeInsets.only(bottom: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Name',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Phone Number',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          obscureText: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Enter Donation Type',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          obscureText: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Enter Quantity',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () {
                          //  Navigator.of(context).pushReplacement(
                          //      MaterialPageRoute(builder: (context) => DonorContact()));
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
