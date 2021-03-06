import 'package:example_of_login/note/add_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNote extends StatelessWidget {
  final AddNoteController addNoteController = AddNoteController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNoteController.addNote();
        },
        child: Icon(Icons.save),
      ),
      bottomNavigationBar: pickImageBtn(),
      appBar: AppBar(
        title: Text("Add your note here"),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            _field(controller: addNoteController.titleController, hint: "Title"),
            _field(controller: addNoteController.noteController, hint: "Note"),
            Obx(() => addNoteController.imagePreview)
          ],
        ),
      ),
    );
  }

  Widget pickImageBtn() {
    return MaterialButton(
      onPressed: () {
        addNoteController.pickImage();
      },
      child: Text("Pick Image"),
      color: Colors.green,
    );
  }

  Widget _field(
      {@required String hint, @required TextEditingController controller}) {
    InputBorder border = OutlineInputBorder();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLines: hint == "Note" ? 5 : 1,
        decoration: InputDecoration(
            hintText: hint, enabledBorder: border, focusedBorder: border),
      ),
    );
  }
}
