import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AppPicker {

  static void showImagePicker(BuildContext context, {required Function(File) onPicked}) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: false,
        withReadStream: false,
      );
      if (result != null && result.files.isNotEmpty) {
        final path = result.files.first.path;
        if (path != null) onPicked(File(path));
      }
    } catch (e) {
      debugPrint('Image picker error: $e');
    }
  }

  static void showAudioPicker(BuildContext context, {required Function(File) onPicked}) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
        withData: false,
        withReadStream: false,
      );
      if (result != null && result.files.isNotEmpty) {
        final path = result.files.first.path;
        if (path != null) onPicked(File(path));
      }
    } catch (e) {
      debugPrint('Audio picker error: $e');
    }
  }

  static void showVideoPicker(BuildContext context, {required Function(File) onPicked}) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.video,
        allowMultiple: false,
        withData: false,
        withReadStream: false,
      );
      if (result != null && result.files.isNotEmpty) {
        final path = result.files.first.path;
        if (path != null) onPicked(File(path));
      }
    } catch (e) {
      debugPrint('Video picker error: $e');
    }
  }
}