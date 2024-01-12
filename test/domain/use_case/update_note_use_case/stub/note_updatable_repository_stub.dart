import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/isp/note_updatable_repository.dart';

import '../../dummy/note_entity_list_dummy.dart';

class NoteUpdatableRepositoryStub implements NoteUpdatableRepository {
  @override
  Future<Result<NoteEntity>> update(NoteEntity entity) async {
    return Result.success(NoteEntityDummy.data[0]);
  }
}