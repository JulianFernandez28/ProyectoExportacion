import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storage = FirebaseStorage.instance;

Future<PlatformFile?> openFileS() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;
    return file;
  }

  return null;
}
