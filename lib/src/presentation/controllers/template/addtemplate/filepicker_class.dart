import 'package:file_picker/file_picker.dart';

abstract class FilePickerService {
  Future<FilePickerResult?> pickFile();
}

class FilePickerServiceImpl implements FilePickerService {
  @override
  Future<FilePickerResult?> pickFile() async {
    return await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );
  }
}
