import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/controller/addnote/addnote_cubit.dart';
import 'package:notes_app/core/constants.dart';
import 'package:notes_app/views/custom_colors_circle.dart';

class ListViewColors extends StatefulWidget {
  const ListViewColors({super.key});

  @override
  State<ListViewColors> createState() => _ListViewColorsState();
}

class _ListViewColorsState extends State<ListViewColors> {
  
  int curentIndex = 0;
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
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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