import 'package:note_app/domain/model/note_entity.dart';

import '../model/result.dart';

abstract interface class NoteDeletableRepository {
  Future<Result<NoteEntity>> delete({required String id});
}