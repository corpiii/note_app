import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/note_deletable_repository.dart';

import '../../dummy/note_entity_list_dummy.dart';

class NoteDeletableRepositoryStub implements NoteDeletableRepository {
  @override
  Future<Result<NoteEntity>> delete({required String id}) async {
    return Result.success(NoteEntityDummy.data[0]);
  }
}