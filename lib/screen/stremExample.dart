import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  @override
  _StreamExampleState createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Example"),
      ),
      body: Column(
        children: [
          RaisedButton(onPressed: (){},
          )
        ],
      ),
    );
  }
}