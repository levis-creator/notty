import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:notty/styles/styles.dart';
import 'package:notty/widgets/editor_toolbar.dart';
import 'package:notty/widgets/pop_menu.dart';

class SingleNote extends StatefulWidget {
  SingleNote({
    super.key,
    required this.data,
  });
  final Map data;

  @override
  State<SingleNote> createState() => _SingleNoteState();
}

class _SingleNoteState extends State<SingleNote> {
  bool editNote = false;
  // this are menu items for the popup
  Set<String> menuItem = {'Edit', 'Delete'};

  // popup function
  void selectingPopupItem(value) {
    switch (value) {
      case 'Edit':
        setState(() {
          editNote = true;
        });

        break;
      case 'Delete':
        print("Delete clicked");

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    var title = widget.data['title'];
    QuillController quillController = QuillController(
        document: Document.fromJson(jsonDecode(widget.data['notes'])),
        selection: const TextSelection.collapsed(offset: 0));
    TextEditingController editTitleController =
        TextEditingController(text: title);
    editTitleController.text = title;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopMenu(
            menuItem: menuItem,
            selectedItem: (value) => selectingPopupItem(value),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            editNote
                ? TextFormField(
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    controller: editTitleController,
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        hintText: "Title",
                        hintStyle: Styles.headLineStyle2
                            .copyWith(color: Colors.black38)),
                  )
                : Text(
                    widget.data['title'],
                    style: Styles.headLineStyle,
                  ),
            Expanded(
              flex: 1,
              child: QuillProvider(
                  configurations:
                      QuillConfigurations(controller: quillController),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: QuillEditor.basic(
                          configurations: QuillEditorConfigurations(
                            scrollable: true,
                            readOnly: editNote ? false : true,
                            showCursor: editNote ? true : false,
                            placeholder: 'Notes empty',
                          ),
                        ),
                      ),
                      editNote ? const EditorToolBar() : const SizedBox()
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}


// TODO: design the note section
// TODO: Add a color picker
