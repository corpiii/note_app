import 'package:note_app/domain/model/note_entity.dart';

abstract class NoteEntityDummy {
  static final dummyDate = DateTime.now();

  static List<NoteEntity> data = [
    NoteEntity(
        id: '1',
        backgroundColorHex: '951ed0',
        fontColorHex: 'c88751',
        title: 'title1',
        content: 'content1',
        timestamp: dummyDate.add(const Duration(days: 1)).toIso8601String()),
    NoteEntity(
        id: '2',
        backgroundColorHex: '0463c4',
        fontColorHex: 'd13ae1',
        title: 'title2',
        content: 'content2',
        timestamp: dummyDate.add(const Duration(days: 2)).toIso8601String()),
    NoteEntity(
        id: '3',
        backgroundColorHex: '8ebf13',
        fontColorHex: '6f40b7',
        title: 'title3',
        content: 'content3',
        timestamp: dummyDate.add(const Duration(days: 3)).toIso8601String()),
    NoteEntity(
        id: '4',
        backgroundColorHex: '2c1019',
        fontColorHex: 'a5e13a',
        title: 'title4',
        content: 'content4',
        timestamp: dummyDate.add(const Duration(days: 4)).toIso8601String()),
    NoteEntity(
        id: '5',
        backgroundColorHex: '69c5c1',
        fontColorHex: '59cbc3',
        title: 'title5',
        content: 'content5',
        timestamp: dummyDate.add(const Duration(days: 5)).toIso8601String()),
    NoteEntity(
        id: '6',
        backgroundColorHex: '3b8574',
        fontColorHex: '0bc55b',
        title: 'title6',
        content: 'content6',
        timestamp: dummyDate.add(const Duration(days: 6)).toIso8601String()),
  ];
}
