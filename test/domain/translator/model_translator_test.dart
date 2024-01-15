import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/translator/model_translator.dart';

void main() {
  test('translate NoteEntity to NoteModel is Success', () {
    // given
    final dummyData = ['1', 'FFFFFF', '000000', 'title', 'content'];
    final translator = ModelTranslator();

    final entity = NoteEntity(
      id: dummyData[0],
      backgroundColorHex: dummyData[1],
      fontColorHex: dummyData[2],
      title: dummyData[3],
      content: dummyData[4],
      timestamp: dummyData[5],
    );

    // when
    final model = translator.translateTo(entity);

    final result = [
      model.id,
      model.backgroundColorHex,
      model.fontColorHex,
      model.title,
      model.content
    ];

    // then
    final list = List<int>.generate(dummyData.length, (index) => index);

    list.forEach((index) {
      expect(result[index], dummyData[index]);
    });
  });

  test('translate NoteModel to NoteEntity is Success', () {
    // given
    final dummyData = ['2', '000000', 'FFFFFF', 'title', 'content'];
    final translator = ModelTranslator();

    final model = NoteModel(
      id: dummyData[0],
      backgroundColorHex: dummyData[1],
      fontColorHex: dummyData[2],
      title: dummyData[3],
      content: dummyData[4],
      timestamp: DateTime.parse(dummyData[5]),
    );

    // when
    final entity = translator.translateFrom(model);

    final result = [
      entity.id,
      entity.backgroundColorHex,
      entity.fontColorHex,
      entity.title,
      entity.content
    ];

    // then
    final list = List<int>.generate(dummyData.length, (index) => index);

    list.forEach((index) {
      expect(result[index], dummyData[index]);
    });
  });
}