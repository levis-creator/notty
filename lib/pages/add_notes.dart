import 'dart:convert';

import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:notty/controllers/notes.controller.dart';
import 'package:notty/styles/styles.dart';

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
    final QuillController controller0 = QuillController.basic();
    var notesJson = jsonEncode(controller0.document.toDelta().toJson());
    final TextEditingController titleController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Note'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: "Title",
                    hintStyle:
                        Styles.headLineStyle2.copyWith(color: Colors.black38)),
              ),
              QuillProvider(
                  configurations: QuillConfigurations(controller: controller0),
                  child: Column(
                    children: [
                      const DropShadow(
                        borderRadius: 20,
                        child: QuillToolbar(
                          configurations: QuillToolbarConfigurations(
                            showFontFamily: false,
                            showIndent: false,
                            showInlineCode: false,
                            showRightAlignment: false,
                            showStrikeThrough: false,
                            showSubscript: false,
                            showJustifyAlignment: false,
                            showCodeBlock: false,
                            showSearchButton: false,
                            showLink: false,
                            showQuote: false,
                            showSuperscript: false,
                            showFontSize: false,
                            showUndo: false,
                            showRedo: false,
                            showClearFormat: false,
                            showHeaderStyle: false,
                            showColorButton: false,
                            multiRowsDisplay: false,
                            showDividers: false,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: QuillEditor.basic(
                          configurations: const QuillEditorConfigurations(
                              readOnly: false, placeholder: "Add Notes"),
                          scrollController: ScrollController(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                            var controller = NotesController();
                            DateTime now = DateTime.now();
                            DateTime currenTimeStamp = now.toUtc();
                            try {
                              controller.createNote(titleController.text,
                                  notesJson, currenTimeStamp);
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: const Text("Save"),
                        ),
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
