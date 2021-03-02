import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{
  
  //collection reference
  final CollectionReference userLog = FirebaseFirestore.instance.collection('userLogs');
  
  // Future updateUserData(String name, int age){

  // }


}