import 'dart:io';

String getFileSize(File file) {
  int bytes = file.lengthSync();

  if (bytes < 1024) {
    return "$bytes B";
  } else if (bytes < 1024 * 1024) {
    return "${(bytes / 1024).toStringAsFixed(2)} KB";
  } else {
    return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB";
  }
}