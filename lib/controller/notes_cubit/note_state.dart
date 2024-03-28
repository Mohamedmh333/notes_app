import 'package:notes_app/models/note_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}
class NotesSuccess extends NotesState {}
class NoteDeleting extends NotesState {
  final int noteIndex;

  NoteDeleting(this.noteIndex);
}


