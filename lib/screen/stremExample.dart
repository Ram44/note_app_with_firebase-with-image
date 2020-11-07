import 'dart:async';
import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  @override
  _StreamExampleState createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  // ignore: close_sinks
  StreamController<String> streamController = StreamController();
  @override
  void initState() {
  //  _listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Example"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
             // streamController.sink.add("this is the initial stream");
             streamController.sink.add(DateTime.now().second.toString());
            },
            color: Colors.green,
            child: Text("Add"),
          ),
          StreamBuilder(
            stream: streamController.stream,
          //  initialData: 1,
            builder: (context, AsyncSnapshot snapshot) {
              return snapshot.hasData?Text(snapshot.data):Text("No data is  available");
            },
          ),
        ],
      ),
    );
  }

  _listen() {
    streamController.stream.listen((event) {
      print(event);
    });
  }
}
