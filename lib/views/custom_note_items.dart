import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
import 'package:notes_app/core/app_router.dart';
import 'package:notes_app/models/note_model.dart';

class CustomNoteItem extends StatefulWidget {
  CustomNoteItem({super.key, required this.note, required this.query});
  final NoteModel note;
  final String query;
  @override
  State<CustomNoteItem> createState() => _CustomNoteItemState();
}

class _CustomNoteItemState extends State<CustomNoteItem> {
  bool isDelete = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.keditview, extra: widget.note);
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isDelete ? 0.0 : 1.0,
        child: AnimatedContainer(
            duration: Duration(seconds: 5),
            height: isDelete ? 0 : 200,
            decoration: BoxDecoration(
                color: Color(widget.note.color),
                borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: Text(
                      widget.note.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        widget.note.subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black.withOpacity(.5), fontSize: 18),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          // setState(() {
                          //   isDelete = true;
                          // });
                          // Future.delayed(Duration(milliseconds: 500), () {
                          widget.note.delete();

                          BlocProvider.of<NotesCubit>(context)
                              .fetchNotes(query: widget.query);
                          // });

                          // widget.note.delete();
                          // BlocProvider.of<NotesCubit>(context).fetchNotes();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.trash,
                          color: Colors.black,
                        )),
                  ),
                  const Expanded(
                      child: SizedBox(
                    height: 10,
                  )),
                  Padding(
                    padding: EdgeInsets.only(right: 35),
                    child: Text(
                      widget.note.date,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
// // import 'package:notes_app/core/app_router.dart';
// // import 'package:notes_app/models/note_model.dart';

// // class CustomNoteItem extends StatefulWidget {
// //   CustomNoteItem({Key? key, required this.note}) : super(key: key);

// //   final NoteModel note;

// //   @override
// //   _CustomNoteItemState createState() => _CustomNoteItemState();
// // }

// // class _CustomNoteItemState extends State<CustomNoteItem> {
// //   bool _isDeleting = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         GoRouter.of(context).push(AppRouter.keditview);
// //       },
// //       child: AnimatedOpacity(
// //         duration: Duration(milliseconds: 1000),
// //         opacity: _isDeleting ? 0.0 : 1.0,
// //         child: AnimatedContainer(
// //           duration: Duration(seconds: 5),
// //           height: _isDeleting ? 0 : 200,
// //           decoration: BoxDecoration(
// //             color: const Color.fromARGB(255, 255, 216, 164),
// //             borderRadius: BorderRadius.circular(18),
// //           ),
// //           child: Padding(
// //             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.end,
// //               children: [
// //                 ListTile(
// //                   title: Text(
// //                     widget.note.title,
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 25,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   subtitle: Padding(
// //                     padding: EdgeInsets.only(top: 15),
// //                     child: Text(
// //                       widget.note.subTitle,
// //                       style: TextStyle(
// //                         color: Colors.black.withOpacity(.5),
// //                         fontSize: 18,
// //                       ),
// //                     ),
// //                   ),
// //                   trailing: IconButton(
// //                     onPressed: () {
// //                       setState(() {
// //                         _isDeleting = true;
// //                       });
// //                       Future.delayed(Duration(milliseconds: 500), () {
// //                         widget.note.delete();
// //                         BlocProvider.of<NotesCubit>(context).fetchNotes();
// //                       });
// //                     },
// //                     icon: Icon(
// //                       FontAwesomeIcons.trash,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                 ),
// //                 const Expanded(
// //                   child: SizedBox(
// //                     height: 10,
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: EdgeInsets.only(right: 35),
// //                   child: Text(
// //                     widget.note.date,
// //                     style: TextStyle(
// //                       color: Colors.black.withOpacity(.5),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(
// //                   height: 10,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:notes_app/models/note_model.dart';

// class CustomNoteItem extends StatefulWidget {
//   const CustomNoteItem({
//     Key? key,
//     required this.note,
//     required this.onDelete,
//   }) : super(key: key);

//   final NoteModel note;
//   final VoidCallback onDelete;

//   @override
//   State<CustomNoteItem> createState() => _CustomNoteItemState();
// }

// class _CustomNoteItemState extends State<CustomNoteItem> {
//    bool isDeleting=false;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       opacity: isDeleting ? 0.0 : 1.0,
//       duration: Duration(milliseconds: 500),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 500),
//         height: isDeleting ? 0 : 200,
//         curve: Curves.easeInOut,
//         child: GestureDetector(
//           onTap: () {
//             // Handle onTap action
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 ListTile(
//                   title: Text(
//                     widget.note.title,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                   subtitle: Text(
//                     widget.note.subTitle,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   trailing: IconButton(
//                     onPressed: widget.onDelete,
//                     icon: Icon(Icons.delete),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
