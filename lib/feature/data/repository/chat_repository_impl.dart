import 'package:chat_demo/feature/data/data_source/chat_storage.dart';
import 'package:chat_demo/feature/data/model/message_model.dart';
import 'package:chat_demo/feature/domain/entities/message.dart';
import 'package:chat_demo/feature/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDataSource localDataSource;

  ChatRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveMessage(Message message) async {
    final model = MessageModel(
      message: message.message,
      senderId: message.senderId,
      timestamp: message.timestamp,
      mediaPath: message.mediaPath,
      mediaType: message.mediaType,
    );
    await localDataSource.saveMessage(model);
  }

  @override
  Future<List<Message>> getMessages() async {
    final models = await localDataSource.getMessages();
    return models.map((e)=>
        Message(
            message: e.message,
            senderId: e.senderId,
            timestamp: e.timestamp,
            mediaPath: e.mediaPath,
            mediaType: e.mediaType)
    ).toList();
  }
}