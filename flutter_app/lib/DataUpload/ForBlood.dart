import 'package:cloud_firestore/cloud_firestore.dart';

class Blood{
  String Name;
  String Phone;
  String BloodGroup;
  String Gander;
  String City;

  Blood();

  Blood.fromMap(Map<String, dynamic> data){
    Name = data['Name'];
    Phone = data['Phone'];
    BloodGroup = data['BloodGroup'];
    Gander = data['Gander'];
    City = data['City'];
  }


}

