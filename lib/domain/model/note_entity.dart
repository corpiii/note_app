import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note_entity.freezed.dart';

@freezed
class NoteEntity with _$NoteEntity {
  const factory NoteEntity({
    required String id,
    required String colorHex,
    required String title,
    required String content
  }) = _NoteEntity;
}