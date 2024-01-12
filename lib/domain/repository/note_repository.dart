import 'package:note_app/domain/repository/isp/note_creatable_repository.dart';
import 'package:note_app/domain/repository/isp/note_deletable_repository.dart';
import 'package:note_app/domain/repository/isp/note_fetchable_repository.dart';
import 'package:note_app/domain/repository/isp/note_updatable_repository.dart';

abstract interface class NoteRepository implements NoteCreatableRepository, NoteFetchableRepository,
    NoteUpdatableRepository, NoteDeletableRepository {}