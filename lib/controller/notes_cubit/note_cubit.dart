import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/controller/notes_cubit/note_state.dart';
import 'package:notes_app/core/constants.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  List<NoteModel>? ModifedBooks;

  fetchNotes({String? query}) {
    var notesBox = Hive.box<NoteModel>(knoteBox);
    notes = notesBox.values.toList();
    if (query != null) {
      ModifedBooks =
          notes!.where((product) => product.title.startsWith(query)).toList();
    }
    emit(NotesSuccess());
  }

  void deleteNote(int noteIndex) {
    emit(
        NoteDeleting(noteIndex)); // Emit state indicating note is being deleted
    // Perform deletion logic here, for example:
    notes!.removeAt(noteIndex);
    // You might perform async operations here like API calls or DB operations.
    // After deletion is complete, you can emit new state if needed.
  }
}
