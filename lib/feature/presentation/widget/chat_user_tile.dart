import 'package:flutter/material.dart';
import '../../../core/util/date/app_date.dart';

class ChatUserTile extends StatelessWidget {
  final Map<String,dynamic> user;
  const ChatUserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(user["name"]),
      subtitle: Text(user["message"]),
      trailing: Text(AppDate.hourMinuteFormat),
      onTap: (){},
    );;
  }
}
