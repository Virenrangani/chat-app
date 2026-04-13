import 'dart:io';
import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/border_radius/app_border_radius.dart';
import '../../../core/constant/padding/app_padding.dart';
import '../../../core/util/app_picker/app_picker.dart';

class ChatOption extends StatelessWidget {
  final Function(File) onImagePicked;
  final Function(File) onAudioPicked;
  final Function(File) onVideoPicked;

  const ChatOption({
    super.key,
    required this.onImagePicked,
    required this.onAudioPicked,
    required this.onVideoPicked,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.edgeAll16,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.verTop12,
        color: AppColor.textWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          commonIconButton(Icons.image, () {
            Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 200), () {
              AppPicker.showImagePicker(context, onPicked: onImagePicked);
            });
          }),

          commonIconButton(Icons.audio_file, () {
            Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 200), () {
              AppPicker.showAudioPicker(context, onPicked: onAudioPicked);
            });
          }),

          commonIconButton(Icons.videocam_outlined, () {
            Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 200), () {
              AppPicker.showVideoPicker(context, onPicked: onVideoPicked);
            });
          }),

        ],
      ),
    );
  }

  Widget commonIconButton(IconData iconData, Function onPressed) {
    return IconButton(
      onPressed: () => onPressed.call(),
      icon: Icon(iconData),
    );
  }
}