import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/hive/notes_data.dart';
import 'package:notes_app/generated/codegen_loader.g.dart';
import 'package:notes_app/notes_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesDataAdapter());
  await Hive.openBox<NotesData>('notes');

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('ru'),
      assetLoader:  CodegenLoader(),
      path: 'assets/translations',
      child: const NotesApp(),
    ),
  );
}
