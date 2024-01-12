import 'package:note_app/domain/model/note_entity.dart';

import '../../model/result.dart';

abstract interface class NoteUpdatableRepository {
  Future<Result<NoteEntity>> update(NoteEntity entity);
}