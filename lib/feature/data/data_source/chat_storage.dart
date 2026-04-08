import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/message_model.dart';

class ChatLocalDataSource {
  static const String key = "chat_messages";

  Future<void> saveMessage(MessageModel message) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> messages = prefs.getStringList(key) ?? [];

    messages.add(jsonEncode(message.toJson()));

    await prefs.setStringList(key, messages);
  }

  Future<List<MessageModel>> getMessages() async {
    try{
      final prefs = await SharedPreferences.getInstance();

      final data = prefs.getStringList(key) ?? [];

      return data
          .map((e) => MessageModel.fromJson(jsonDecode(e)))
          .toList();
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}