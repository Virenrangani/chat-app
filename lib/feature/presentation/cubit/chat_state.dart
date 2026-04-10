import 'dart:io';
import '../../domain/entities/message.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;
  final File? selectedImage;
  final File? selectedAudio;
  final File? selectedVideo;

  ChatLoaded(this.messages,{this.selectedImage,this.selectedAudio,this.selectedVideo});
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}