import "dart:io";
import "dart:typed_data";

import "package:file_picker/file_picker.dart";
import "package:firebase_core/firebase_core.dart";

import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";

class DataDocument {
  String? nameFile;
  bool status = false;
}

final FirebaseStorage storage = FirebaseStorage.instance;

Future uploadIImageFirebase(PlatformFile file) async {
  File files = File(file.path!);
  print(file.name);
  print(file.path);

  final storageRef = FirebaseStorage.instance.ref();

  final mountainsRef = storageRef.child(file.name);
  await mountainsRef.putFile(files);
  print(mountainsRef);

  final mountainImagesRef = storageRef.child("images/${file.name}");
  print(mountainImagesRef);

  final url = await mountainsRef.getDownloadURL();
  print(url);

  return url;
}
