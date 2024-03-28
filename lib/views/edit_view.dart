import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_viewbody.dart';

class EditView extends StatelessWidget {
  const EditView({super.key,required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:  EditViewBody(note: note,));
  }
}
