import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/translator/model_translator.dart';
import 'package:note_app/domain/usecase/update_note_use_case/interface/update_note_use_case.dart';

import '../../repository/isp/note_updatable_repository.dart';

class UpdateNoteUseCaseImpl implements UpdateNoteUseCase {
  final NoteUpdatableRepository _repository;

  const UpdateNoteUseCaseImpl({
    required NoteUpdatableRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<NoteModel>> execute(NoteModel model) async {
    final translator = ModelTranslator();
    final entity = translator.translateFrom(model);
    final result = await _repository.update(entity);

    switch (result) {
      case Success<NoteEntity>():
        final model = translator.translateTo(result.data);

        return Result.success(model);
      case Error<NoteEntity>():
        return Result.error(result.message);
    }
  }
}