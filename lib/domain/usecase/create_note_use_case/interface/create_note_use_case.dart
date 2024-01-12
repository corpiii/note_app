import '../../../model/note_model.dart';
import '../../../model/result.dart';

abstract interface class CreateNoteUseCase {
  void execute(String backgroundColorHex, String fontColorHex, String title, String content);
}
