import 'dart:io';
import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:chat_demo/core/constant/text_style/app_text_style.dart';
import 'package:chat_demo/core/widget/file_pages/file_pages.dart';
import 'package:chat_demo/core/widget/file_size/file_size.dart';
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
          style: AppTextStyles.titleMedium(),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("1 pages",style: AppTextStyles.captionMedium()),
            SizedBox(width:4),
            dot(),
            SizedBox(width:4),
            Text(getFileSize(file),style: AppTextStyles.captionMedium()),
            SizedBox(width:4),
            dot(),
            SizedBox(width:4),
            Text(extension,style: AppTextStyles.captionMedium(),)
          ],
        ),
        onTap: () => OpenFilex.open(file.path),

      ),
    );
  }
}

Widget dot(){
  return Container(
    height: 4,
    width: 4,
    decoration: BoxDecoration(
        color:AppColor.secondary,
        shape: BoxShape.circle
    ),
  );
}