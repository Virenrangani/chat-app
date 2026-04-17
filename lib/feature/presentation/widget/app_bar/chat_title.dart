import 'package:flutter/material.dart';
import '../../../../core/constant/colour/app_color.dart';
import '../../../../core/constant/text_style/app_text_style.dart';

class ChatTitle extends StatelessWidget {
  const ChatTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text("WhatsApp",
            style: AppTextStyles.h3(color: AppColor.scaffoldBackground))),
        iconButton((){}, Icons.currency_rupee),
        iconButton((){}, Icons.camera_alt_outlined),
        CircleAvatar(
            radius: 18,
            backgroundColor: AppColor.primaryLight,
            child: Icon(Icons.person,)
        ),
      iconButton((){},Icons.more_vert_outlined)
    ]
    );
  }
}
Widget iconButton(VoidCallback onPressed,IconData icon){
  return IconButton(onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Icon(icon, size: 20,
          color: AppColor.scaffoldBackground)
  );
}
