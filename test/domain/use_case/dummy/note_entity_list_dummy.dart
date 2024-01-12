import 'package:note_app/domain/model/note_entity.dart';

abstract class NoteEntityDummy {
  static List<NoteEntity> data = [
    const NoteEntity(id: '1', backgroundColorHex: '951ed0', fontColorHex: 'c88751', title: 'title1', content: 'content1'),
    const NoteEntity(id: '2', backgroundColorHex: '0463c4', fontColorHex: 'd13ae1', title: 'title2', content: 'content2'),
    const NoteEntity(id: '3', backgroundColorHex: '8ebf13', fontColorHex: '6f40b7', title: 'title3', content: 'content3'),
    const NoteEntity(id: '4', backgroundColorHex: '2c1019', fontColorHex: 'a5e13a', title: 'title4', content: 'content4'),
    const NoteEntity(id: '5', backgroundColorHex: '69c5c1', fontColorHex: '59cbc3', title: 'title5', content: 'content5'),
    const NoteEntity(id: '6', backgroundColorHex: '3b8574', fontColorHex: '0bc55b', title: 'title6', content: 'content6'),
  ];
}