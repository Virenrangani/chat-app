import 'package:chat_demo/core/constant/text_style/app_text_style.dart';
import 'package:chat_demo/core/widget/file_extension_icon/file_extension_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import '../../cubit/chat_cubit.dart';

class DocumentChat extends StatelessWidget {
  const DocumentChat({super.key});

  @override
  Widget build(BuildContext context) {
    final file=context.read<ChatCubit>().file;
    final String? extension=file?.path.split('.').last;
    if(file == null){
      return const SizedBox.shrink();
    }
    return ListTile(
      leading: getFileIcon(extension!),
      title: Text(
        file.path.split('/').last,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.h5(),
      ),
      subtitle: const Text("Tap to open"),
      onTap: () => OpenFilex.open(file.path),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => context.read<ChatCubit>().clearDocument(),
      ),
    );
  }
}
