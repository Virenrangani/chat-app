import 'package:chat_demo/feature/presentation/widget/chat_tile.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

List<User> users = [
  User(id: "1", name: "Viren"),
  User(id: "2", name: "Ram"),
];

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          final user=users[index];
          return ChatTile(user:user);
        });
  }
}
