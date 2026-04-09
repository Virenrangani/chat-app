import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppPicker {

  static void showImagePicker(BuildContext context) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: false,
        withReadStream: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final path = result.files.first.path;
        if (path != null) {
          final file = File(path);
          debugPrint("Selected image: ${file.path}");
        }
      }
    } catch (e) {
      debugPrint('Image picker error: $e');
    }
  }

  static void showAudioPicker(BuildContext context) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
        withData: false,
        withReadStream: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final path = result.files.first.path;
        if (path != null) {
          final file = File(path);
          print("Selected audio: ${file.path}");
        }
      }
    } catch (e) {
      debugPrint('Audio picker error: $e');
    }
  }

  static void showVideoPicker(BuildContext context) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.video,
        allowMultiple: false,
        withData: false,
        withReadStream: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final path = result.files.first.path;
        if (path != null) {
          final file = File(path);
          debugPrint("Selected video: ${file.path}");
        }
      }
    } catch (e) {
      debugPrint('Video picker error: $e');
    }
  }
}