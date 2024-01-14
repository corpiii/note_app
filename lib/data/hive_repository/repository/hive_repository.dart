import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/common/repository_error.dart';
import 'package:note_app/data/hive_repository/dao/hive_note_dao.dart';
import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/result.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class HiveRepository implements NoteRepository {
  static const _boxName = 'noteBox';

  final StreamController<Result<List<NoteEntity>>> _streamController = StreamController();

  @override
  Stream<Result<List<NoteEntity>>> get noteListStream => _streamController.stream;

  @override
  Future<Result<NoteEntity>> create({required NoteEntity entity}) async {
    final box = await Hive.openBox(_boxName);

    final dao = HiveNoteDAO(
        id: entity.id,
        backgroundColorHex: entity.backgroundColorHex,
        fontColorHex: entity.fontColorHex,
        title: entity.title,
        content: entity.content);

    try {
      await box.add(dao);
      return Result.success(entity);
    } catch (_) {
      return Result.error(RepositoryError.create.description);
    }
  }

  @override
  Future<Result<NoteEntity>> delete({required String id}) {
    throw UnimplementedError;
  }

  @override
  void fetch() {}

  @override
  Future<Result<NoteEntity>> update(NoteEntity entity) {
    throw UnimplementedError;
  }
}
