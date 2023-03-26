// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:cloudinary_public/cloudinary_public.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cloudinary Form',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cloudinary Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 final result = await FilePicker.platform.pickFiles();
//                 setState(() {
//                   _filePickerResult = result;
//                 });
//               },
//               child: Text('Seleccionar archivo'),
//             ),
//             if (_filePickerResult != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: Text(_filePickerResult!.files.single.name),
//               ),
//             if (_isUploading)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: CircularProgressIndicator(),
//               ),
//             ElevatedButton(
//               onPressed: _filePickerResult == null ? null : _uploadFile,
//               child: Text('Subir archivo'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  