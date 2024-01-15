import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/common/repository_error.dart';
import 'package:note_app/data/hive_repository/dao/hive_note_dao.dart';
import 'package:note_app/data/mapper/hive_note_dao_mapper.dart';
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
    try {
      final box = await Hive.openBox<HiveNoteDAO>(_boxName);
      final dao = HiveNoteDAO(
          id: entity.id,
          backgroundColorHex: entity.backgroundColorHex,
          fontColorHex: entity.fontColorHex,
          title: entity.title,
          content: entity.content);

      await box.add(dao);

      final mapper = HiveNoteDAOMapper();
      final resultList = box.values.map((e) => mapper.mapperTo(e)).toList();

      _streamController.add(Result.success(resultList));

      return Result.success(entity);
    } catch (_) {
      return Result.error(RepositoryError.create.description);
    }
  }

  @override
  Future<Result<NoteEntity>> delete({required String id}) async {
    try {
      final box = await Hive.openBox<HiveNoteDAO>(_boxName);
      final notes = box.values.toList();

      for(int i = 0; i < notes.length; i++) {
        final note = notes[i];

        if (note.id == id) {
          await box.deleteAt(i);

          final mapper = HiveNoteDAOMapper();
          final resultList = box.values.map((e) => mapper.mapperTo(e)).toList();

          _streamController.add(Result.success(resultList));
          return Result.success(mapper.mapperTo(note));
        }
      }

      return Result.error(RepositoryError.delete.description);
    } catch (error) {
      return Result.error(RepositoryError.delete.description);
    }
  }

  @override
  void fetch() async {
    try {
      final box = await Hive.openBox<HiveNoteDAO>(_boxName);

      final mapper = HiveNoteDAOMapper();
      final resultList = box.values.map((e) => mapper.mapperTo(e)).toList();

      _streamController.add(Result.success(resultList));
    } catch (_) {
      _streamController.add(Result.error(RepositoryError.fetch.description));
    }
  }

  @override
  Future<Result<NoteEntity>> update(NoteEntity entity) async {
    try {
      final box = await Hive.openBox<HiveNoteDAO>(_boxName);
      final notes = box.values.toList();

      for(int i = 0; i < notes.length; i++) {
        final note = notes[i];

        if (note.id == entity.id) {
          final mapper = HiveNoteDAOMapper();

          await box.deleteAt(i);
          await box.add(mapper.mapperFrom(entity));

          final resultList = box.values.map((e) => mapper.mapperTo(e)).toList();

          _streamController.add(Result.success(resultList));
          return Result.success(mapper.mapperTo(note));
        }
      }
      return Result.error(RepositoryError.update.description);
    } catch (error) {
      return Result.error(RepositoryError.update.description);
    }
  }
}
