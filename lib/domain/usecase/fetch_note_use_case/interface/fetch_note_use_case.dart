import 'package:note_app/domain/model/note_model.dart';

import '../../../model/result.dart';

abstract interface class FetchNoteUseCase {
  Stream<Result<List<NoteModel>>> get noteListStream;
  void execute();
}