import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:chat_demo/core/constant/padding/app_padding.dart';
import 'package:chat_demo/core/constant/text_style/app_text_style.dart';
import 'package:chat_demo/core/widget/text_field/app_text_field.dart';
import 'package:chat_demo/feature/domain/entities/user.dart';
import 'package:chat_demo/feature/presentation/widget/app_bar/chat_title.dart';
import 'package:chat_demo/feature/presentation/widget/chat_message.dart';
import 'package:chat_demo/feature/presentation/widget/chat_option.dart';
import 'package:chat_demo/feature/presentation/widget/select_media_file.dart';
import 'package:chat_demo/feature/presentation/widget/user_chat.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
  TextEditingController messageController = TextEditingController();
  late User currentUser;
  final FocusNode messageFocusNode = FocusNode();

  @override
  void initState() {
    currentUser = widget.user;
    super.initState();
  }

  @override
  void dispose() {
    messageFocusNode.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return BlocProvider(
  create: (context) => GetIt.I<ChatCubit>(),
  child: Scaffold(
    backgroundColor: Colors.black,
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
        title: ChatTitle(user: currentUser),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam,color: AppColor.scaffoldBackground),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.call,color: AppColor.scaffoldBackground),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert,color: AppColor.scaffoldBackground),
          onPressed: () {},
        ),
      ],
      backgroundColor: AppColor.primaryDark,
    ),
      body: BlocBuilder<ChatCubit, ChatState>(

        builder: (context, state) {
          final cubit=context.read<ChatCubit>();
          if (state is ChatLoaded) {
            return Column(
              children: [

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (cubit.showEmoji) cubit.toggleEmoji();
                      messageFocusNode.unfocus();
                    },
                    child: UserChat(
                      messages: state.messages,
                      currentUserId: currentUser.id,
                    ),
                  ),
                ),

                SelectMediaFile(),

                Padding(
                  padding: AppPadding.edgeAll20,
                  child: Row(
                    children: [
                      Expanded(
                        child: AppFormField(
                          hintText: "Message",
                          controller: messageController,
                          focusNode: messageFocusNode,
                          prefixIcon: IconButton(
                            onPressed: () {
                              if (cubit.showEmoji) {
                                cubit.toggleEmoji();
                                messageFocusNode.requestFocus();
                              } else {
                                messageFocusNode.unfocus();
                                cubit.toggleEmoji();
                              }
                            },
                            icon: cubit.showEmoji
                                ? const Icon(Icons.keyboard)
                                : const Icon(Icons.emoji_emotions_outlined),
                          ),
                          suffix: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final ChatCubit chatCubit=context.read<ChatCubit>();
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        ChatOption(
                                          onImagePicked: (file) => chatCubit.selectDocument(file, MediaType.image),
                                          onAudioPicked: (file) => chatCubit.selectDocument(file, MediaType.audio),
                                          onVideoPicked: (file) => chatCubit.selectDocument(file, MediaType.video),
                                          onDocumentPicked: (file)=>chatCubit.selectDocument(file, MediaType.document),
                                        ),
                                  );
                                },
                                icon: const Icon(Icons.attach_file),
                              ),
                              IconButton(
                                onPressed: () {
                                  final text = messageController.text.trim();

                                  final hasFile = state.file!=null;

                                  if (text.isNotEmpty || hasFile) {
                                    context.read<ChatCubit>().sendMessage(text, currentUser.id);
                                    messageController.clear();
                                  }
                                },
                                icon: const Icon(Icons.send),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width:10,),
                      CircleAvatar(
                        backgroundColor: AppColor.primaryDark,
                        radius: 28,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.mic,color: AppColor.scaffoldBackground,),),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: cubit.showEmoji ? 250 : keyboardHeight,
                  child: cubit.showEmoji ?
                  EmojiPicker(
                    textEditingController: messageController,
                    config:  Config(
                      height: 250,
                      emojiViewConfig: EmojiViewConfig(
                        emojiSizeMax: 24,
                        columns: 8,
                      ),
                    ),
                  )
                      : const SizedBox(),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    ),
    );
  }
}