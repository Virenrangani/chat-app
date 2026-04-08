import 'package:flutter/material.dart';
import '../../../core/constant/padding/app_padding.dart';
import '../../../core/constant/text_style/app_text_style.dart';
import '../../data/model/message_model.dart';

class ChatMessage extends StatelessWidget {
  final MessageModel msg;

  const ChatMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: AppPadding.edgeAll4,
        color: Colors.green,
        child: Column(
          children: [
            Text(msg.message,style: AppTextStyles.h5(),),
            Text(msg.timestamp,style: AppTextStyles.titleSmall(),)
          ],
        )
    );
  }
}
