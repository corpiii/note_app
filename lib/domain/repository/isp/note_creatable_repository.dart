import 'package:note_app/domain/model/note_entity.dart';

import '../../model/result.dart';

abstract interface class NoteCreatableRepository {
  Future<Result<NoteEntity>> create({
    required String backgroundColorHex,
    required String fontColorHex,
    required String title,
    required String content
  });
}
