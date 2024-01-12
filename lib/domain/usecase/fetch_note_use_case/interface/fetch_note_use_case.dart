import 'package:note_app/domain/model/note_model.dart';

abstract interface class FetchNoteUseCase {
  Stream<List<NoteModel>> get noteListStream;
  void fetch();
}