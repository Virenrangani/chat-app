import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:chat_demo/core/constant/padding/app_padding.dart';
import 'package:chat_demo/core/constant/text_style/app_text_style.dart';
import 'package:chat_demo/feature/presentation/page/user_chat_page.dart';
import 'package:flutter/material.dart';
import '../../../core/util/date/app_date.dart';
import '../../domain/entities/user.dart';

class ChatTile extends StatelessWidget {
  final User user;
  const ChatTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserChatPage(user: user),
          ),
        );
      },
      child: Padding(
        padding: AppPadding.edgeAll12,
        child: Row(
          children: [

            CircleAvatar(
              radius: 26,
              backgroundColor: AppColor.primaryLight,
              child: Text(
                (user.name[0]),
                style: AppTextStyles.h5(color: AppColor.primary)
              ),
            ),

            SizedBox(width: 12),

          ],
        ),
      ),
    );
  }
}
