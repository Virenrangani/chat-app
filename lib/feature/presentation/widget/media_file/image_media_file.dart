import 'dart:io';

import 'package:flutter/cupertino.dart';

class ImageMediaFile extends StatelessWidget {
  final File file;
  const ImageMediaFile({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Image.file(
        file,
        height: 180, fit: BoxFit.cover);
  }
}
