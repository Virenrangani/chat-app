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
          radius: 18,
          backgroundColor: AppColor.primaryLight,
          child: Text(
            (user.name[0]),
            style: AppTextStyles.h4(color: AppColor.primaryDark)
          ),
        ),

        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              user.name,
              style: AppTextStyles.h4(
                color: AppColor.scaffoldBackground,
              ),
            ),

            Text(
              "online",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
