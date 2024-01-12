import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/isp/note_deletable_repository.dart';
import 'package:note_app/domain/translator/model_translator.dart';
import 'package:note_app/domain/usecase/delete_note_use_case/interface/delete_note_use_case.dart';

class DeleteNoteUseCaseImpl implements DeleteNoteUseCase {
  final NoteDeletableRepository _repository;

  const DeleteNoteUseCaseImpl({
    required NoteDeletableRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<NoteModel>> execute(NoteModel model) async {
    final result = await _repository.delete(id: model.id);

    switch (result) {
      case Success<NoteEntity>():
        final translator = ModelTranslator();
        final model = translator.translateTo(result.data);

        return Result.success(model);
      case Error<NoteEntity>():
        return Result.error(result.message);
    }
  }
}