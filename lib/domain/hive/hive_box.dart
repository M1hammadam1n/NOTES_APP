import 'package:hive/hive.dart';
import 'package:notes_app/domain/hive/notes_data.dart';

abstract class HiveBoxes {
  static final notes = Hive.box<NotesData>('notes');
 }