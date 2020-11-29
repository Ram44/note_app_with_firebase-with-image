import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example_of_login/NodedDemo/notemodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AddNoteController extends GetxController {
  static Widget widget() => SizedBox();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String _docId = DateTime.now().toString();

  Rx<Widget> _imagePreview = widget().obs;
  Widget get imagePreview => _imagePreview.value;

  File imageFile;

  ///
  ///
  ///
  pickImage() async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      _imagePreview.value = Image.file(
        imageFile,
        height: 200,
      );
    } else {}
  }

  Future<String> _uploadImage() async {
    FirebaseStorage storage = FirebaseStorage.instance;

    StorageReference reference = storage.ref().child(_docId);
    StorageUploadTask upTask = reference.putFile(imageFile);
    StorageTaskSnapshot snap = await upTask.onComplete;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  ///
  ///
  addNote() async {
    _progress(show:true);
    FirebaseFirestore ins = FirebaseFirestore.instance;
  //  await Future.delayed(Duration(seconds: 3));
    String _imageUrl = "";
    _imageUrl=await _uploadImage();
    NoteModel note = NoteModel(
        title: titleController.text,
        note: noteController.text,
        documentId: _docId,
        imageUrl: _imageUrl);
    await ins.collection("notes").doc(_docId).set(note.toMap());
       _progress(show:false);
    Get.back();
    
}
_progress({@required show}){
  if(show){
Get.rawSnackbar(
duration: Duration(minutes: 5),
messageText: Text("Saving"),
backgroundColor: Colors.white,
margin: EdgeInsets.all(10.0),
overlayBlur: 4,
isDismissible: true,
overlayColor: Colors.black12,
borderRadius: 10.0
);



  }else{
    if(Get.isSnackbarOpen)Get.back();
    Get.back();
  }
}
}