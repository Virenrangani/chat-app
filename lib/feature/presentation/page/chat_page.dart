import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:chat_demo/core/constant/padding/app_padding.dart';
import 'package:chat_demo/core/constant/text_style/app_text_style.dart';
import 'package:chat_demo/feature/presentation/widget/app_bar/chat_title.dart';
import 'package:chat_demo/feature/presentation/widget/chat_list.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color:AppColor.primaryDark
            ),
            child: Padding(
              padding: AppPadding.edgeSymmetricHori16,
              child: Column(
                children: [
                  SizedBox(height:80,),
                  ChatTitle()
                ],
              ),
            ),
          ),
          Expanded(child: Chats()),
        ],
      )
    );
  }
}
