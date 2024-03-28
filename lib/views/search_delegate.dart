import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
import 'package:notes_app/controller/notes_cubit/note_state.dart';
import 'package:notes_app/views/list_view_notes.dart';

class Searchdelgate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            FontAwesomeIcons.xmark,
            color: Colors.white,
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) => ListViewNotes(
                notes: BlocProvider.of<NotesCubit>(context).notes!,
                query: query,
              ));
    } else {
      BlocProvider.of<NotesCubit>(context).fetchNotes(query: query);
      return BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) => ListViewNotes(
              notes: BlocProvider.of<NotesCubit>(context).ModifedBooks!,
              query: query));
    }
  }
}
