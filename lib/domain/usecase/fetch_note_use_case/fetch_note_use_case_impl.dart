import 'dart:async';

import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/note_fetchable_repository.dart';
import 'package:note_app/domain/translator/model_translator.dart';
import 'package:note_app/domain/usecase/fetch_note_use_case/interface/fetch_note_use_case.dart';

class FetchNoteUseCaseImpl implements FetchNoteUseCase {
  final NoteFetchableRepository _repository;
  final StreamController<Result<List<NoteModel>>> _streamController = StreamController();

  @override
  Stream<Result<List<NoteModel>>> get noteListStream => _streamController.stream;

  FetchNoteUseCaseImpl({
    required NoteFetchableRepository repository,
  }) : _repository = repository {
    _bind();
  }

  void _bind() {
    _repository.noteListStream.listen((result) {
      switch (result) {
        case Success<List<NoteEntity>>():
          final translator = ModelTranslator();
          final noteModelList = result.data.map((entity) {
            return translator.translateTo(entity);
          }).toList();

          _streamController.add(Result.success(noteModelList));
        case Error<List<NoteEntity>>():
          _streamController.add(Result.error(result.message));
      }
    });
  }

  @override
  void execute() {
    _repository.fetch();
  }
}