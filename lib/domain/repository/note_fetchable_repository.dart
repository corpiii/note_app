import '../model/note_entity.dart';

abstract interface class NoteFetchableRepository {
  Stream<List<NoteEntity>> get noteListStream;
  void fetch();
}