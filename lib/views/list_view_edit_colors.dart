import 'package:flutter/material.dart';
import 'package:notes_app/core/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/custom_colors_circle.dart';

class ListViewColorsEdit extends StatefulWidget {
  const ListViewColorsEdit({super.key, required this.note});
  final NoteModel note;
  @override
  State<ListViewColorsEdit> createState() => _ListViewColorsState();
}

class _ListViewColorsState extends State<ListViewColorsEdit> {
  late int curentIndex;
  @override
  void initState() {
    curentIndex = kColors.indexOf(Color(widget.note.color));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                onTap: () {
                  curentIndex = index;
                  widget.note.color = kColors[index].value;
                  setState(() {});
                },
                child: CustomColors(
                  isSelected: curentIndex == index,
                  colorPick: kColors[index],
                ),
              ),
            );
          }),
    );
  }
}
