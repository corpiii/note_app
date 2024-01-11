import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/domain/model/note_entity.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/translator/model_translator.dart';

void main() {
  test('translate NoteEntity to NoteModel is Success', () {
    // given
    final dummyData = ['1', 'FFFFFF', 'title', 'content'];
    final translator = ModelTranslator();

    final entity = NoteEntity(
      id: dummyData[0],
      colorHex: dummyData[1],
      title: dummyData[2],
      content: dummyData[3],
    );

    // when
    final model = translator.translateTo(entity);

    final result = [
      model.id,
      model.colorHex,
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
    final dummyData = ['2', '000000', 'title', 'content'];
    final translator = ModelTranslator();

    final model = NoteModel(
      id: dummyData[0],
      colorHex: dummyData[1],
      title: dummyData[2],
      content: dummyData[3],
    );

    // when
    final entity = translator.translateFrom(model);

    final result = [
      entity.id,
      entity.colorHex,
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