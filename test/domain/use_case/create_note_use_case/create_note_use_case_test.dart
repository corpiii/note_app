import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/isp/note_creatable_repository.dart';
import 'package:note_app/domain/usecase/create_note_use_case/create_note_use_case_impl.dart';

import 'stub/note_creatable_repository_stub.dart';

void main() {
  test('CreateNoteUseCase create test', () async {
    // given
    final NoteCreatableRepository repository = NoteCreatableRepositoryStub();
    final sut = CreateNoteUseCaseImpl(repository: repository);
    const emptyString = '';

    // when
    final result = await sut.execute(
      backgroundColorHex: emptyString,
      fontColorHex: emptyString,
      title: emptyString,
      content: emptyString,
    );

    // then
    switch (result) {
      case Success<NoteModel>():
        expect(result.data != null, true);
      case Error<NoteModel>():
        Exception('error occurred');
    }
  });
}
