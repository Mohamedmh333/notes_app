import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/controller/notes_cubit/note_cubit.dart';
import 'package:notes_app/core/app_router.dart';
import 'package:notes_app/core/constants.dart';
import 'package:notes_app/core/simple_bloc_observer.dart';
import 'package:notes_app/models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(knoteBox);

  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (context) => NotesCubit(),
        ),
      ],
      child: SafeArea(
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'google'),
        ),
      ),
    );
  }
}
