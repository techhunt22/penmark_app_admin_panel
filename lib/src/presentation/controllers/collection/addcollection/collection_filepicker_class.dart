import 'package:file_picker/file_picker.dart';

abstract class CollectionFilePickerClass {
  Future<FilePickerResult?> pickFile();
}

class CollectionFilePickerServiceImpl implements CollectionFilePickerClass {
  @override
  Future<FilePickerResult?> pickFile() async {
    return await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );
  }
}
