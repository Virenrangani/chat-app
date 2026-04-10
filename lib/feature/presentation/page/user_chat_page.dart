import 'package:chat_demo/core/constant/padding/app_padding.dart';
import 'package:chat_demo/core/widget/text_field/app_text_field.dart';
import 'package:chat_demo/feature/data/data_source/chat_storage.dart';
import 'package:chat_demo/feature/domain/entities/user.dart';
import 'package:chat_demo/feature/presentation/widget/chat_option.dart';
import 'package:chat_demo/feature/presentation/widget/select_media_file.dart';
import 'package:chat_demo/feature/presentation/widget/user_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class UserChatPage extends StatefulWidget {
  final User user;
  const UserChatPage({super.key, required this.user});

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  ChatCubit chatCubit = GetIt.I<ChatCubit>();
  TextEditingController messageController = TextEditingController();
  late User currentUser;

  @override
  void initState() {
    chatCubit.loadMessages();
    currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(currentUser.name)),
      body: BlocBuilder<ChatCubit, ChatState>(
        bloc: chatCubit,
        builder: (context, state) {
          if (state is ChatLoaded) {
            return Column(
              children: [

                Expanded(
                  child: UserChat(
                    messages: state.messages,
                    currentUserId: currentUser.id,
                  ),
                ),

                SelectMediaFile(state: state, chatCubit: chatCubit),

                Padding(
                  padding: AppPadding.edgeAll20,
                  child: AppFormField(
                    controller: messageController,
                    prefixIcon: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ChatOption(
                            onImagePicked: (file) => chatCubit.selectImage(file),
                            onAudioPicked: (file) => chatCubit.selectAudio(file),
                            onVideoPicked: (file) => chatCubit.selectVideo(file),
                          ),
                        );
                      },
                      icon: const Icon(Icons.attach_file),
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        final text = messageController.text.trim();

                        final hasFile = state.selectedImage != null ||
                            state.selectedAudio != null ||
                            state.selectedVideo != null;

                        if (text.isNotEmpty || hasFile) {
                          chatCubit.sendMessage(text, currentUser.id);
                          messageController.clear();
                        }
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                ),

              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}