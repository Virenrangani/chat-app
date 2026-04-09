import 'package:flutter/cupertino.dart';

class MessageText extends StatelessWidget {
  final String message;

  const MessageText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(message),
    );
  }
}
