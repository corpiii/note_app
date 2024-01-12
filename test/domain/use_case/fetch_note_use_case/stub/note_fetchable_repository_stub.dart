import 'dart:async';

import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/repository/note_fetchable_repository.dart';

import '../../dummy/note_entity_list_dummy.dart';

class NoteFetchableRepositoryStub implements NoteFetchableRepository {
  final StreamController<List<NoteEntity>> _controller = StreamController();

  @override
  void fetch() {
    final dummy = NoteEntityDummy.data;

    _controller.add(dummy);
  }

  @override
  Stream<List<NoteEntity>> get noteListStream => _controller.stream;
}