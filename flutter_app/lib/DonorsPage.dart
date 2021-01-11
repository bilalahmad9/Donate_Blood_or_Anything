import 'package:flutter/material.dart';

class DonorContact extends StatefulWidget {
  @override
  _DonorContactState createState() => _DonorContactState();
}

class _DonorContactState extends State<DonorContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          " All Donations Record",
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      //drawer: Drawer(
       // child: MainDrawer(),
      //),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(
              "images/cc.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}