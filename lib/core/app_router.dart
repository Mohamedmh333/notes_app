import 'package:go_router/go_router.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_view.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/search_delegate.dart';

abstract class AppRouter {
  // static const knoteview='/noteView';
  static const keditview = '/editView';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const NotesView()),
    GoRoute(
        path: keditview,
        builder: (context, state) =>  EditView(
              note: state.extra as NoteModel,
            )),
  ]);
}
