import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/colour/app_color.dart';
import '../../../../core/constant/text_style/app_text_style.dart';
import '../../../domain/entities/user.dart';

class ChatTitle extends StatelessWidget {
  final User user;
  const ChatTitle({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius:26,
          backgroundColor: Colors.blue.shade200,
          child: Text(
              user.name[0].toUpperCase(),
              style: AppTextStyles.bodyLarge(color: AppColor.info)
          ),
        ),
        SizedBox(width: 10),
        Text(
          user.name,
          style: AppTextStyles.h4(color: AppColor.scaffoldBackground),
        ),
      ],
    );
  }
}
