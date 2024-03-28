import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
import 'package:notes_app/controller/notes_cubit/note_state.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/list_view_notes.dart';
import 'package:notes_app/views/notes_appbar.dart';
import 'package:notes_app/views/search_delegate.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(
              text: 'Notes',
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
              ),
              onPressed: () {
                showSearch(context: context, delegate: Searchdelgate());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ListViewNoteItems(),
          ],
        ));
  }
}

class ListViewNoteItems extends StatelessWidget {
  const ListViewNoteItems({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

      return Expanded(child: ListViewNotes(notes: notes,query: '',));
    });
  }
}
