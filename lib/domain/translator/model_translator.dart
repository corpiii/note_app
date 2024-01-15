import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/translator/interface/translator.dart';

class ModelTranslator implements Translator<NoteEntity, NoteModel> {
  @override
  NoteEntity translateFrom(NoteModel data) {
    return NoteEntity(
        id: data.id,
        backgroundColorHex: data.backgroundColorHex,
        fontColorHex: data.fontColorHex,
        title: data.title,
        content: data.content,
        timestamp: data.timestamp.toIso8601String(),
    );
  }

  @override
  NoteModel translateTo(NoteEntity data) {
    return NoteModel(
        id: data.id,
        backgroundColorHex: data.backgroundColorHex,
        fontColorHex: data.fontColorHex,
        title: data.title,
        content: data.content,
        timestamp: DateTime.parse(data.timestamp),
    );
  }
}
