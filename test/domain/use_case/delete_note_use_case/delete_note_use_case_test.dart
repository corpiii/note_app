import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/note_deletable_repository.dart';
import 'package:note_app/domain/translator/model_translator.dart';
import 'package:note_app/domain/usecase/delete_note_use_case/delete_note_use_case_impl.dart';

import '../dummy/note_entity_list_dummy.dart';
import 'stub/note_deletable_repository_stub.dart';

void main() {
  test('DeleteUseCase test', () async {
    // given
    final NoteDeletableRepository repository = NoteDeletableRepositoryStub();
    final sut = DeleteNoteUseCaseImpl(repository: repository);
    final entity = NoteEntityDummy.data[0];
    final model = ModelTranslator().translateTo(entity);

    // when
    final result = await sut.execute(model);

    // then
    switch(result) {
      case Success<NoteModel>():
        expect(entity.id, model.id);
      case Error<NoteModel>():
        Exception('error occured');
    }
  });
}