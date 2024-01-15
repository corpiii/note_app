import 'package:note_app/domain/model/note_entity.dart';

abstract interface class EntityMapper<From> {
  NoteEntity mapperTo(From data);
  From mapperFrom(NoteEntity entity);
}