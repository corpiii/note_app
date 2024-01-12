import 'package:note_app/domain/model/note_model.dart';

import '../../../model/result.dart';

abstract interface class CreateNoteUseCase {
  Future<Result<NoteModel>> execute(String backgroundColorHex, String fontColorHex, String title, String content);
}
