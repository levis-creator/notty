import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class EditorToolBar extends StatelessWidget {
  const EditorToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: const QuillToolbar(
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
    );
  }
}
