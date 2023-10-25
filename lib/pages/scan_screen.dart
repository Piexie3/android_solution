import 'dart:typed_data';

import 'package:android_solution/utils/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Uint8List? _file;
  @override
  void initState() {
    super.initState();
    selectImage();
  }

  Future<void> selectImage() async {
    Uint8List file = await pickImage(
      ImageSource.camera,
    );
    setState(() {
      _file = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Scan Screen"),
      ),
    );
  }
}
