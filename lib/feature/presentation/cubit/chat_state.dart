import 'dart:io';
import 'package:chat_demo/feature/presentation/widget/chat_message.dart';

import '../../domain/entities/message.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;
  final File? file;
  final MediaType? mediaType;

  ChatLoaded(this.messages, {this.file, this.mediaType,});
}

class ChatError extends ChatState {
  final String message;

  ChatError(this.message);
}