// import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/pages/searchnote_page.dart';
import 'package:notes_app/ui/pages/addnote_page.dart';
import 'package:notes_app/ui/pages/changeNote_page.dart';
import 'package:notes_app/ui/pages/home_page.dart';
import 'package:notes_app/ui/routes/app_routes.dart';

class AppNavigator {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.addNotes,
        builder: (context, state) => const AddNotespage(),
      ),
      GoRoute(
        path: AppRoutes.changeNotes,
        builder: (context, state) => const ChangeNotePage(),
      ),
      GoRoute(
        path: AppRoutes.searchNotes,
        builder: (context, state) => const SearchNotePage(),
      ),
    ],
  );
  static GoRouter get router => _router;
}