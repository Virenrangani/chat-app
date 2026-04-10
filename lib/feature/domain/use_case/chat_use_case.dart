import 'package:chat_demo/feature/domain/entities/message.dart';
import 'package:chat_demo/feature/domain/repositories/chat_repository.dart';

class ChatUseCase {
  final ChatRepository chatRepository;
  ChatUseCase({required this.chatRepository});


  Future<void> callSave(Message message) async {
    await chatRepository.saveMessage(message);
  }

  Future<List<Message>> callGetMessage() async {
    return await chatRepository.getMessages();
  }
}