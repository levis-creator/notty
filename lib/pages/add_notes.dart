import 'dart:convert';

import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:gap/gap.dart';
import 'package:notty/controllers/notes.controller.dart';
import 'package:notty/styles/styles.dart';
import 'package:notty/widgets/editor_toolbar.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final database_controller = NotesController();
    final QuillController controller0 = QuillController.basic();
    final TextEditingController titleController = TextEditingController();
    // Addingt to database
    void onSaveButton() {
      var notesJson = jsonEncode(controller0.document.toDelta().toJson());
      //  this is getting the current date
      DateTime now = DateTime.now();
      //  this is creating a timestamp of the date
      int currenTimeStamp = now.millisecondsSinceEpoch;
      // this will add to  database
      database_controller.createNote(
          titleController.text, notesJson, currenTimeStamp);
      Navigator.pushNamed(context, '/');
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('New Note'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: QuillProvider(
              configurations: QuillConfigurations(controller: controller0),
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    controller: titleController,
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        hintText: "Title",
                        hintStyle: Styles.headLineStyle2
                            .copyWith(color: Colors.black38)),
                  ),
                  Gap(15),
                  Expanded(
                    child: QuillEditor.basic(
                      configurations: const QuillEditorConfigurations(
                        readOnly: false,
                        placeholder: "Add notes",
                      ),
                    ),
                  ),
                  EditorToolBar(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: onSaveButton,
                    ),
                  )
                ],
              )),
        ));
  }
}
