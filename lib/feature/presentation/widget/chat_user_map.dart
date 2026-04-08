import 'package:chat_demo/feature/presentation/widget/chat_user_tile.dart';
import 'package:flutter/material.dart';

List<Map<String,dynamic>> userProfile=[
  {
    "name":"Viren",
    "message":"Hello"
  },
  {
    "name":"Ram",
    "message":"How are you"
  }
];

class ChatUserMap extends StatelessWidget {
  const ChatUserMap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userProfile.length,
        itemBuilder: (context,index){
          final user=userProfile[index];
          return ChatUserTile(user:user,);
        });
  }
}
