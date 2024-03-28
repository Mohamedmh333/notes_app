import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/controller/addnote/addnote_state.dart';
import 'package:notes_app/core/constants.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = kColors[0];
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());

    try {
      var noteBox = Hive.box<NoteModel>(knoteBox);
      emit(AddNoteSuccess());
      await noteBox.add(note);
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}
