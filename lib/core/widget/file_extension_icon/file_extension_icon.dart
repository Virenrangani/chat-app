import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Icon getFileIcon(String ext) {
  switch (ext) {
    case "pdf":
      return const Icon(Icons.picture_as_pdf_outlined,
          color: Colors.red);

    case "docx":
      return const Icon(Icons.description,
          color: Colors.blue);

    case "xlsx":
      return const Icon(Icons.table_chart,
          color: Colors.green);

    default:
      return const Icon(Icons.insert_drive_file_outlined);
  }
}