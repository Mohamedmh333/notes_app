import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/controller/addnote/addnote_cubit.dart';
import 'package:notes_app/controller/addnote/addnote_state.dart';
import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
import 'package:notes_app/views/form_bottom_sheet.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errorMessage}');
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();

            GoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: const FormBottomSheet());
        },
      ),
    );
    // child: FormBottomSheet());
  }
}
