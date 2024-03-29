import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note_model.freezed.dart';

@freezed
class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String id,
    required String backgroundColorHex,
    required String fontColorHex,
    required String title,
    required String content,
    required DateTime timestamp,
  }) = _NoteModel;
}