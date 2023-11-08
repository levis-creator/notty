import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notty/controllers/notes.controller.dart';
import 'package:notty/util/media_query.dart';
import 'package:notty/widgets/header_container.dart';
import 'package:notty/widgets/note_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic _notes;
  int length = 0;
  @override
  void initState() {
    super.initState();
    _notes = NotesController().box;
  }

  @override
  Widget build(BuildContext context) {
    final size = ScreenSize.getSize(context);
    final NotesController noteController = NotesController();
    //this deletes the notes
    void deleteNotes(key) {
      setState(() {
        _notes.deleteAt(key);
      });
      noteController.getNotes();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderContainer(
              size: size,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box('notes').listenable(),
                builder: (BuildContext context, dynamic value, Widget? child) {
                  if (value.isEmpty) {
                    return const Text('Add notes');
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _notes.length,
                      itemBuilder: (context, index) {
                        var box = value;
                        var getData = box.getAt(index);
                        print(getData['createDate']);
                        return NoteWidget(
                          data: getData,
                          index: index,
                          deleteNote: (context) => deleteNotes(index),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_notes');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
