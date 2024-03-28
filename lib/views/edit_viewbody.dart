import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
import 'package:notes_app/core/utils/custom_textfield.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/list_view_edit_colors.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  @override
  void initState() {
    controllerTitle.text = widget.note.title;
    controllerSubtitle.text = widget.note.subTitle;
    super.initState();
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerSubtitle.dispose();
    super.dispose();
  }

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerSubtitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          CustomEditAppBar(
            onPressedSuccess: () {
              widget.note.title = controllerTitle.text;
              // ?? widget.note.title;
              widget.note.subTitle = controllerSubtitle.text;
              // ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchNotes();
              GoRouter.of(context).pop();
            },
            onPressedBack: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(FontAwesomeIcons.check),
            text: 'Edit Note',
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            controller: controllerTitle,
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            controller: controllerSubtitle,
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          ListViewColorsEdit(
            note: widget.note,
          )
        ]));
  }
}

class CustomEditAppBar extends StatelessWidget {
  const CustomEditAppBar(
      {super.key,
      required this.text,
      required this.icon,
      this.onPressedSuccess,
      this.onPressedBack});
  final String text;
  final Icon icon;
  final Function()? onPressedSuccess;
  final Function()? onPressedBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: onPressedBack,
            icon: const Icon(FontAwesomeIcons.arrowLeft)),
        Text(
          text,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(16)),
          child: IconButton(onPressed: onPressedSuccess, icon: icon),
        ),
      ],
    );
  }
}
