import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/isp/note_updatable_repository.dart';
import 'package:note_app/domain/translator/model_translator.dart';
import 'package:note_app/domain/usecase/update_note_use_case/update_note_use_case_impl.dart';

import '../dummy/note_entity_list_dummy.dart';
import 'stub/note_updatable_repository_stub.dart';

void main() {
  test('UpdateNoteUseCase test', () async {
    // given
    final NoteUpdatableRepository repository = NoteUpdatableRepositoryStub();
    final sut = UpdateNoteUseCaseImpl(repository: repository);
    final entity = NoteEntityDummy.data[0];
    final model = ModelTranslator().translateTo(entity);

    // when
    final result = await sut.execute(model);

    // then
    switch(result) {
      case Success<NoteModel>():
        expect(result.data, model);
      case Error<NoteModel>():
        Exception('error occurred');
    }
  });
}