import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/usecase/fetch_note_use_case/fetch_note_use_case_impl.dart';

import '../dummy/note_entity_list_dummy.dart';
import 'stub/note_fetchable_repository_stub.dart';

void main() {
  test('FetchNoteUseCase fetch test', () {
    // given
    final noteFetchableRepository = NoteFetchableRepositoryStub();
    final sut = FetchNoteUseCaseImpl(repository: noteFetchableRepository);

    // when, then
    sut.noteListStream.listen((result) {
      switch (result) {
        case Success<List<NoteModel>>():
          NoteEntityDummy.data.asMap().forEach((index, entity) {
            final model = result.data[index];

            expect(model.id, entity.id);
            expect(model.backgroundColorHex, entity.backgroundColorHex);
            expect(model.fontColorHex, entity.fontColorHex);
            expect(model.title, entity.title);
            expect(model.content, entity.content);
          });
        case Error<List<NoteModel>>():
          Exception('error');
      }
    });

    sut.execute();
  });
}
