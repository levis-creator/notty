import 'package:hive_flutter/hive_flutter.dart';

class NotesController {
  NotesController();

  var box = Hive.box('notes');

  List<dynamic> notesData = [];
  void createNote(String title, dynamic notes, int createDate) {
    Map newNote = <String, dynamic>{
      "title": title,
      "notes": notes,
      "createDate": createDate,
    };
    box.add(newNote);
  }

  void getNotes() {
    box.get('notes');
  }
}
