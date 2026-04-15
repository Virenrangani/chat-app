import 'package:chat_demo/core/constant/text_style/app_text_style.dart';
import 'package:flutter/material.dart';

class Timestamp extends StatelessWidget {
  final String timestamp;

  const Timestamp({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Text(
      timestamp,
      style: AppTextStyles.captionMedium(),
    );
  }
}
