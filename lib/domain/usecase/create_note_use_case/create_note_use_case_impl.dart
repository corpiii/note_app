import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/isp/note_creatable_repository.dart';
import 'package:note_app/domain/translator/model_translator.dart';
import 'package:uuid/uuid.dart';
import 'interface/create_note_use_case.dart';

class CreateNoteUseCaseImpl implements CreateNoteUseCase {
  final NoteCreatableRepository _repository;

  CreateNoteUseCaseImpl({
    required NoteCreatableRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<NoteModel>> execute({
    required String backgroundColorHex,
    required String fontColorHex,
    required String title,
    required String content
  }) async {
    final entity = NoteEntity(
      id: const Uuid().v1(),
      backgroundColorHex: backgroundColorHex,
      fontColorHex: fontColorHex,
      title: title,
      content: content,
    );

    final result = await _repository.create(entity: entity);

    switch (result) {
      case Success<NoteEntity>():
        final model = ModelTranslator().translateTo(result.data);

        return Result.success(model);
      case Error<NoteEntity>():
        return Result.error(result.message);
    }
  }
}
