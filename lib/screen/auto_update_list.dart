import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AutoUpdateList extends StatefulWidget {
  @override
  _AutoUpdateListState createState() => _AutoUpdateListState();
}

class _AutoUpdateListState extends State<AutoUpdateList> {

  FirebaseFirestore ins=FirebaseFirestore.instance;
  // @override
  // void initState() {

  //   super.initState();
  // }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto update List"),
      ),
      body:StreamBuilder(
        stream: ins.collection("message").doc('second').snapshots(),
        builder:(context,AsyncSnapshot<DocumentSnapshot> snapshot){
        return snapshot.hasData?Text(snapshot.data.data().toString()):Text("NO Data");
      } ),
    );
  }
}