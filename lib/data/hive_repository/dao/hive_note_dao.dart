import 'package:hive/hive.dart';

part 'hive_note_dao.g.dart';

@HiveType(typeId: 0)
class HiveNoteDAO extends HiveObject {
  @HiveField(0) String id;
  @HiveField(1) String backgroundColorHex;
  @HiveField(2) String fontColorHex;
  @HiveField(3) String title;
  @HiveField(4) String content;
  @HiveField(5) String timestamp;

  HiveNoteDAO({
    required this.id,
    required this.backgroundColorHex,
    required this.fontColorHex,
    required this.title,
    required this.content,
    required this.timestamp,
  });
}