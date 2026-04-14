import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import '../../../../core/widget/file_extension_icon/file_extension_icon.dart';

class DocumentMediaFile extends StatelessWidget {
  final File file;
  const DocumentMediaFile({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    final String extension=file.path.split('.').last;

    return SizedBox(
      width: 300,
      child: ListTile(
        leading: getFileIcon(extension),
        title: Text(
          file.path.split('/').last,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: const Text("Tap to open"),
        onTap: () => OpenFilex.open(file.path),

      ),
    );
  }
}