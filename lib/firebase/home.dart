import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _editingController = TextEditingController();
  String initialdata='';
  List<Widget>doclist=[SizedBox()];
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase crude operation'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _editingController
          ),
          RaisedButton(
            onPressed: () async {
              // print(_editingController.text);
              FirebaseFirestore ins = FirebaseFirestore.instance;
              Map<String, dynamic> data = {
                'typedValue':_editingController.text
              };

              //await ins.collection("Message").add(data);
              await ins.collection("message").doc("second").set(data);
            },
            color: Colors.orange,
            child: Text("Create"),
          ),
          RaisedButton(
            onPressed: () async {
               FirebaseFirestore ins = FirebaseFirestore.instance;
              Map<String, dynamic> data = {
                'dateTime':DateTime.now().toString()
              };

              //await ins.collection("Message").add(data);
              await ins.collection("message").doc("First").update(data);
              // print(_editingController.text);

            },
            color: Colors.red,
            child: Text("Update"),
          ),
          RaisedButton(
            onPressed: ()async {
              FirebaseFirestore ins = FirebaseFirestore.instance;
        //   DocumentSnapshot snap=  await ins.collection("message").doc('second').get();
        //  String _data= snap.data().toString();
        //  setState(() {
           
        //    initialdata=_data;
        //  });
       QuerySnapshot snapshot= await ins.collection('message').orderBy('createdAt',descending: true).get();
    // snapshot.docs;
    List<Widget>temp=List();
    for(QueryDocumentSnapshot document in snapshot.docs){
   String value=document.data().toString();
   temp.add(Container(
     color: Colors.red,
     margin: EdgeInsets.all(20),
     padding: EdgeInsets.all(10),
     child: Text(value)));
    }
    setState(() {
      doclist=temp;
    });
            },
            color: Colors.red,
            child: Text("Read"),
          ),
          Column(
            children: doclist,
          ),
          RaisedButton(
            onPressed: ()async{
         // FirebaseFirestore ins = FirebaseFirestore.instance;
       // await  ins.collection("message").doc("First").delete();
},
            color: Colors.red,
            child: Text("Delete"),
          ),
         // Text("data from firestore$initialdata"),
        ],
      ),
    );
  }
}
