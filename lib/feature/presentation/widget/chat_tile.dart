import 'package:chat_demo/feature/presentation/page/user_chat_page.dart';
import 'package:flutter/material.dart';
import '../../../core/util/date/app_date.dart';
import '../../domain/entities/user.dart';

class ChatTile extends StatelessWidget {
  final User user;
  const ChatTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(user.name),
      trailing: Text(DateFormatter.hourMinuteFormat(DateTime.now())),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder:
                (context)=>UserChatPage(user: user,)));
      },
    );
  }
}
