import '../model/note_entity.dart';
import '../model/result.dart';

abstract interface class NoteFetchableRepository {
  Stream<Result<List<NoteEntity>>> get noteListStream;

  void fetch();
}