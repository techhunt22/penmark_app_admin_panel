import 'package:file_picker/file_picker.dart';

abstract class TemplatesFilePickerService {
  Future<FilePickerResult?> pickFile();
}

class TemplateFilePickerServiceImpl implements TemplatesFilePickerService {
  @override
  Future<FilePickerResult?> pickFile() async {
    return await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );
  }
}
