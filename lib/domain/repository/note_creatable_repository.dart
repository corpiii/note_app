import 'package:note_app/domain/model/note_entity.dart';

import '../model/result.dart';

abstract interface class NoteCreatableRepository {
  Stream<List<NoteEntity>> get noteListStream;

  Future<Result<NoteEntity>> create(
      String backgroundColorHex, String fontHex, String title, String content);
}
