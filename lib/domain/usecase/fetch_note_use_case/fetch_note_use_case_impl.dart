import 'dart:async';

import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/repository/note_fetchable_repository.dart';
import 'package:note_app/domain/translator/model_translator.dart';
import 'package:note_app/domain/usecase/fetch_note_use_case/interface/fetch_note_use_case.dart';

class FetchNoteUseCaseImpl implements FetchNoteUseCase {
  final NoteFetchableRepository _repository;
  final StreamController<List<NoteModel>> _streamController = StreamController();

  @override
  Stream<List<NoteModel>> get noteListStream => _streamController.stream;

  FetchNoteUseCaseImpl({
    required NoteFetchableRepository repository,
  }) : _repository = repository {
    _bind();
  }

  void _bind() {
    _repository.noteListStream.listen((noteEntityList) {
      final translator = ModelTranslator();

      final noteModelList = noteEntityList.map((entity) {
        return translator.translateTo(entity);
      }).toList();

      _streamController.add(noteModelList);
    });
  }

  @override
  void fetch() {
    _repository.fetch();
  }
}