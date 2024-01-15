import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note_entity.freezed.dart';

@freezed
class NoteEntity with _$NoteEntity {
  const factory NoteEntity({
    required String id,
    required String backgroundColorHex,
    required String fontColorHex,
    required String title,
    required String content,
    required String timestamp,
  }) = _NoteEntity;
}