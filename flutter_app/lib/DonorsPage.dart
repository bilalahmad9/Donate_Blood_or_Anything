import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'DonateSelect.dart';
import 'DataFetch/BloodData.dart';

class DonorContact extends StatefulWidget {
  @override
  _DonorContactState createState() => _DonorContactState();
}

class _DonorContactState extends State<DonorContact> {
  List<Data> dataList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference referanceData =
        FirebaseDatabase.instance.reference().child("Data");
    referanceData.once().then((DataSnapshot dataSnapShot) {
      dataList.clear();
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;

      for (var key in keys) {
        Data data = new Data(
          values[key]["_name"],
          values[key]["_phone"],
          values[key]["_BloodGroup"],
          values[key]["_Gander"],
          values[key]["_City"],
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
          " All Donations Record",
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
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
                'No Data is Available',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            )
          : ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (_,index){
            return CardUI(dataList[index].name,dataList[index].phone,dataList[index].BloodGroup,dataList[index].Gander,dataList[index].City);
      }
      ),
    );
  }

  Widget CardUI(name, phone, bloodGroup, gander, city) {
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
            Text(bloodGroup, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text(gander, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text(city, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
