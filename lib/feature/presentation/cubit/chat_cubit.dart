import 'dart:io';

import 'package:chat_demo/core/util/date/app_date.dart';
import 'package:chat_demo/feature/data/model/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/chat_storage.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatLocalDataSource localDataSource;
  File? selectedImage;
  File? selectedAudio;
  File? selectedVideo;

  ChatCubit(this.localDataSource) : super(ChatInitial());

  Future<void> loadMessages() async {
    try {
      emit(ChatLoading());

      final messages = await localDataSource.getMessages();
      emit(ChatLoaded(messages));
    } catch (e) {
      print("message is not fetch");
      emit(ChatError("Failed to load messages"));
    }
  }

  Future<void> sendMessage(String text,String senderId) async {
    try {
      final currentState = state;

      if (currentState is ChatLoaded) {
        final message = MessageModel(
          message: text,
          timestamp: DateFormatter.hourMinuteFormat(DateTime.now()),
          senderId:senderId,
          mediaPath: selectedImage?.path ?? selectedAudio?.path ?? selectedVideo?.path,
          mediaType: selectedImage != null ? "image"
              : selectedAudio != null ? "audio"
              : selectedVideo != null ? "video"
              : null,
        );

        await localDataSource.saveMessage(message);

        final updatedMessages = List<MessageModel>.from(
          currentState.messages,
        )..add(message);

        selectedImage = null;
        selectedAudio = null;
        selectedVideo = null;

        emit(ChatLoaded(updatedMessages));
      }
    } catch (e) {
      emit(ChatError("Failed to send message"));
    }
  }
  void emitCurrentLoaded() {
    if (state is ChatLoaded) {
      emit(ChatLoaded(
        (state as ChatLoaded).messages,
        selectedImage: selectedImage,
        selectedAudio: selectedAudio,
        selectedVideo: selectedVideo,
      ));
    }
  }

  void selectImage(File file) {
    selectedImage = file;
    emitCurrentLoaded();
  }

  void selectAudio(File file) {
    selectedAudio = file;
    emitCurrentLoaded();
  }

  void selectVideo(File file) {
    selectedVideo = file;
    emitCurrentLoaded();
  }

  void clearImage() {
    selectedImage = null;
    emitCurrentLoaded();
  }

  void clearAudio() {
    selectedAudio = null;
    emitCurrentLoaded();
  }

  void clearVideo() {
    selectedVideo = null;
    emitCurrentLoaded();
  }

}