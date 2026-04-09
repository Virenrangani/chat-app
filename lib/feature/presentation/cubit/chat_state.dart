import 'dart:io';

import 'package:chat_demo/feature/data/model/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageModel> messages;
  final File? selectedImage;
  final File? selectedAudio;
  final File? selectedVideo;

  ChatLoaded(this.messages,{this.selectedImage,this.selectedAudio,this.selectedVideo});
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}