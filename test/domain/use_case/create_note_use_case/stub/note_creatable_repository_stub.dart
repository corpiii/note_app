import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/note_creatable_repository.dart';

import '../../dummy/note_entity_list_dummy.dart';

class NoteCreatableRepositoryStub implements NoteCreatableRepository {
  @override
  Future<Result<NoteEntity>> create({
    required String backgroundColorHex,
    required String fontColorHex,
    required String title,
    required String content
  }) async {
    return Result.success(NoteEntityDummy.data[0]);
  }
}
