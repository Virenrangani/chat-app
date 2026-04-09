import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/border_radius/app_border_radius.dart';
import '../../../core/constant/padding/app_padding.dart';
import '../../../core/util/audio_picker/app_audio_picker.dart';

class ChatOption extends StatelessWidget {
  const ChatOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.edgeAll16,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.verTop12,
        color: AppColor.textWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          commonIconButton(Icons.image, () {
            Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 200), () {
              AppPicker.showImagePicker(context);
            });
          }),

          commonIconButton(Icons.audio_file, () {
            Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 200), () {
              AppPicker.showAudioPicker(context);
            });
          }),

          commonIconButton(Icons.videocam_outlined, () {
            Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 200), () {
              AppPicker.showVideoPicker(context);
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