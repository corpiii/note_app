import 'package:note_app/domain/model/note_model.dart';

import '../../../model/result.dart';

abstract interface class UpdateNoteUseCase {
  Future<Result<NoteModel>> execute(NoteModel model);
}