import 'dart:io';
import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:chat_demo/feature/presentation/widget/chat_icon_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/border_radius/app_border_radius.dart';
import '../../../core/constant/padding/app_padding.dart';
import '../../../core/util/app_picker/app_picker.dart';

class ChatOption extends StatelessWidget {
  final Function(File) onImagePicked;
  final Function(File) onAudioPicked;
  final Function(File) onVideoPicked;
  final Function(File) onDocumentPicked;

  const ChatOption({
    super.key,
    required this.onImagePicked,
    required this.onAudioPicked,
    required this.onVideoPicked,
    required this.onDocumentPicked,
  });


  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.edgeAll16,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.verTop24,
        color: AppColor.primaryLight,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChatIconButton(
                icon: Icons.insert_drive_file,
                label: "Document",
                color: Colors.indigo,
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 200), () {
                    AppPicker.showDocumentPicker(context, onPicked: onDocumentPicked);
                  });
                },
              ),
              ChatIconButton(
                icon: Icons.camera_alt,
                label: "Camera",
                color: Colors.pink,
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 200), () {
                    AppPicker.showImagePicker(context, onPicked: onImagePicked);
                  });
                },
              ),
              ChatIconButton(
                icon: Icons.image,
                label: "Gallery",
                color: Colors.purple,
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 200), () {
                    AppPicker.showImagePicker(context, onPicked: onImagePicked);
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChatIconButton(
                icon: Icons.headphones,
                label: "Audio",
                color: Colors.orange,
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 200), () {
                    AppPicker.showAudioPicker(context, onPicked: onAudioPicked);
                  });
                },
              ),
              ChatIconButton(
                icon: Icons.videocam,
                label: "Video",
                color: Colors.teal,
                onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 200), () {
                    AppPicker.showVideoPicker(context, onPicked: onVideoPicked);
                  });
                },
              ),
              ChatIconButton(
                icon: Icons.person,
                label: "Contact",
                color: Colors.blue,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}