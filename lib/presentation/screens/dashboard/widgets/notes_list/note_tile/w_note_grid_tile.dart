import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart';

import 'package:flutter_quill/flutter_quill.dart';

import '../../../../../../logic/utils/extensions/string.dart';
import '../../../../save_note/s_save_note.dart';
import 'note_tile_options.dart';

class NoteGridTile extends StatelessWidget {
  const NoteGridTile({
    required this.options,
    super.key,
  });

  final NoteTileOptions options;

  @override
  Widget build(BuildContext context) {
    final document = Document.fromJson(
      jsonDecode(options.note.text),
    );
    final materialTheme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(
        minHeight: 150,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            SaveNoteScreen.routeName,
            arguments: SaveNoteScreenArgs(
              note: options.note,
            ),
          ),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      options.note.title,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: materialTheme.textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () =>
                          options.sharedOnPressed(context: context),
                      icon: Icon(
                        Icons.delete,
                        color: materialTheme.colorScheme.error,
                      ),
                    ),
                  ],
                ),
                Text(
                  document.toPlainText().removeWhiteSpaces(),
                  softWrap: true,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: materialTheme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
