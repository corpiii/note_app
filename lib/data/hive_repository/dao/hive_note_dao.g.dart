// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_note_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNoteDAOAdapter extends TypeAdapter<HiveNoteDAO> {
  @override
  final int typeId = 0;

  @override
  HiveNoteDAO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveNoteDAO(
      id: fields[0] as String,
      backgroundColorHex: fields[1] as String,
      fontColorHex: fields[2] as String,
      title: fields[3] as String,
      content: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveNoteDAO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backgroundColorHex)
      ..writeByte(2)
      ..write(obj.fontColorHex)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNoteDAOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
