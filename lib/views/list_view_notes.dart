import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/custom_note_items.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({
    super.key,
    required this.notes,
    required this.query
  });
  final List<NoteModel> notes;
  final String query;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: ((context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomNoteItem(
                note: notes[index],
                query:query,
                // onDelete: () {
                //   BlocProvider.of<NotesCubit>(context).deleteNote(index);
                // },
              ));
        }));
  }
}
