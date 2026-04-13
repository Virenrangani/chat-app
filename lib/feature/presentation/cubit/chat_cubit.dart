import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:chat_demo/core/util/date/app_date.dart';
import 'package:chat_demo/feature/data/model/message_model.dart';
import 'package:chat_demo/feature/domain/use_case/chat_use_case.dart';
import 'package:chat_demo/feature/presentation/widget/chat_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../../data/data_source/chat_storage.dart';
import '../../domain/entities/message.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatUseCase chatUseCase;
  File? file;
  MediaType? mediaType;

  ChatCubit({required this.chatUseCase}) : super(ChatInitial()){
    loadMessages();
  }

  bool isPlaying=false;
  bool isVideoPlaying = false;

  final AudioPlayer player = AudioPlayer();
  VideoPlayerController? videoController;


  Future<void> initVideo(File file) async {
    videoController = VideoPlayerController.file(file);

    await videoController!.initialize();

    videoController!.addListener(() {
      isVideoPlaying = videoController!.value.isPlaying;
      emitCurrentLoaded();
    });

    emitCurrentLoaded();
  }

  void toggleVideo() {
    if (videoController == null) return;

    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
    emitCurrentLoaded();
  }

  void disposeVideo() {
    videoController?.dispose();
    videoController = null;
    isVideoPlaying = false;
  }

  Future<void> toggleAudio() async {
    if (file == null) return;
    print("PATH: ${file!.path}");
    print("EXISTS: ${File(file!.path).existsSync()}");
    print("SIZE: ${File(file!.path).lengthSync()}");
    if (isPlaying) {
      await player.pause();
    } else {
      await player.setVolume(1.0);

      await player.play(DeviceFileSource(file!.path));
    }
    isPlaying = !isPlaying;
    emitCurrentLoaded();
  }
  void disposeAudio(){
    player.dispose();
    isPlaying=false;
  }

  Future<void> loadMessages() async {
    try {
      emit(ChatLoading());

      final messages = await chatUseCase.callGetMessage();
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
        final message = Message(
          message: text,
          timestamp: DateFormatter.hourMinuteFormat(DateTime.now()),
          senderId:senderId,
          mediaPath: file?.path,
          mediaType: mediaType.toString()
        );

        await chatUseCase.callSave(message);

        final updatedMessages = List<Message>.from(
          currentState.messages,
        )..add(message);

        file=null;
        mediaType=null;

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
        file: file,
        mediaType: mediaType,
      ));
    }
  }

  void selectDocument(File selectedFile,MediaType type) {
    file = selectedFile;
    mediaType=type;
    emitCurrentLoaded();
  }

  void clearDocument() {
    file = null;
    mediaType=null;
    emitCurrentLoaded();
  }

}