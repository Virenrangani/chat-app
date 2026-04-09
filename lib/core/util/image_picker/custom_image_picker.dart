import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  static final ImagePicker _picker = ImagePicker();

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  await _pick(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  await _pick(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<File?> _pick(ImageSource source) async {
    final XFile? file =
    await _picker.pickImage(source: source, imageQuality: 80);

    if (file != null) {
      return File(file.path);
    }
    return null;
  }
}