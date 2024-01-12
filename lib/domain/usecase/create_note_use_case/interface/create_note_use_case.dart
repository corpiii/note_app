import 'package:note_app/domain/model/note_model.dart';

import '../../../model/result.dart';

abstract interface class CreateNoteUseCase {
  Future<Result<NoteModel>> execute({
    required String backgroundColorHex,
    required String fontColorHex,
    required String title,
    required String content
  });
}
