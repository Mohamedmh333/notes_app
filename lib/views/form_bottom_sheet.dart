import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/controller/addnote/addnote_cubit.dart';
import 'package:notes_app/controller/addnote/addnote_state.dart';
import 'package:notes_app/core/constants.dart';
import 'package:notes_app/core/utils/custom_botton.dart';
import 'package:notes_app/core/utils/custom_textfield.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/list_view_colors.dart';

class FormBottomSheet extends StatefulWidget {
  const FormBottomSheet({
    super.key,
  });

  @override
  State<FormBottomSheet> createState() => _FormBottomSheetState();
}

class _FormBottomSheetState extends State<FormBottomSheet> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              onSaved: (value) {
                title = value;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'Content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            const ListViewColors(),
            const Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var datetime = DateTime.now();
                    var formatedCurrentDate =
                        DateFormat('dd-mm-yy').format(datetime);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatedCurrentDate!,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                text: 'Add',
                TextColor: Colors.black,
                backgroundColor: kprimaryColors,
              );
            })
          ],
        ),
      ),
    );
  }
}
