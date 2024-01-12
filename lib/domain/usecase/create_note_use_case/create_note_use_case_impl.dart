import 'package:note_app/domain/repository/note_creatable_repository.dart';
import 'interface/create_note_use_case.dart';

class CreateNoteUseCaseImpl implements CreateNoteUseCase {
  final NoteCreatableRepository _repository;

  CreateNoteUseCaseImpl({
    required NoteCreatableRepository repository,
  }) : _repository = repository;

  @override
  void execute(String backgroundColorHex, String fontColorHex, String title, String content) async {
    _repository.create(backgroundColorHex, fontColorHex, title, content);
  }
}
