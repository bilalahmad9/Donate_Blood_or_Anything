import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'DonateSelect.dart';
import 'DataFetch/OtherData.dart';

class OtherDonorData extends StatefulWidget {
  @override
  _OtherDonorDataState createState() => _OtherDonorDataState();
}

class _OtherDonorDataState extends State<OtherDonorData> {
  List<Data1> dataList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference referanceData =
    FirebaseDatabase.instance.reference().child("Data1");
    referanceData.once().then((DataSnapshot dataSnapShot) {
      dataList.clear();
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;

      for (var key in keys) {
        Data1 data = new Data1(
          values[key]["_name"],
          values[key]["_phone"],
          values[key]["_type"],
          values[key]["_quantity"],

        );
        dataList.add(data);
      }
      setState(() {
        //
      });
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          " All Other Donations Record",
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => donate()));
        },
      ),
      //drawer: Drawer(
      // child: MainDrawer(),
      //),
      body: dataList.length == 0
          ? Center(
        child: Text(
          'Please wait data loading...',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
        ),
      )
          : ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (_,index){
            return CardUI(dataList[index].name,dataList[index].phone,dataList[index].type,dataList[index].quantity);
          }
      ),
    );
  }

  Widget CardUI(String name, String phone, String type, String quantity) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(15),
      color: Colors.green,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text(phone, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text(type, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text(quantity, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}


