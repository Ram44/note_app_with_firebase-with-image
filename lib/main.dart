//import 'package:example_of_login/firebase/home.dart';
import 'package:example_of_login/NodedDemo/nodedemo.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'package:example_of_login/screen/stremExample.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:NoteDemo()
  ));
}





























// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Cats'),
//       ),
//       body: Column(
//         children: [
//           _getCats(),
//         ],
//       ),
//     );
//   }

//   Widget _getCats() {
//     String apiKey = "65e8f1c1-80bd-4ca7-b75a-b3d47f9a467c";
//     return MaterialButton(
//       onPressed: () async {
//         // http.Response response = await http
//         //     .get("https://api.thecatapi.com/v1/images/search?api_key=$apiKey");
//         // print(response.body);

//         http.Response createVote = await http.post(
//             "https://api.thecatapi.com/v1/votes",
//             headers: {"x-api-key": apiKey},
//             body: {"image_id": "asf2", "sub_id": "my-user-1234", "value": 1});
//         print(createVote.body);
//       },
//       child: Text("Get cats"),
//       color: Colors.green,
//     );
//   }
// }
