import 'package:note_app/data/hive_repository/dao/hive_note_dao.dart';
import 'package:note_app/data/mapper/interface/entity_mapper.dart';
import 'package:note_app/domain/model/note_entity.dart';

class HiveNoteDAOMapper implements EntityMapper<HiveNoteDAO> {
  @override
  HiveNoteDAO mapperFrom(NoteEntity entity) {
    return HiveNoteDAO(
      id: entity.id,
      backgroundColorHex: entity.backgroundColorHex,
      fontColorHex: entity.fontColorHex,
      title: entity.title,
      content: entity.content,
      timestamp: entity.timestamp,
    );
  }

  @override
  NoteEntity mapperTo(HiveNoteDAO data) {
    return NoteEntity(
      id: data.id,
      backgroundColorHex: data.backgroundColorHex,
      fontColorHex: data.fontColorHex,
      title: data.title,
      content: data.content,
      timestamp: data.timestamp,
    );
  }
}
