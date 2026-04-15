import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/audio_duration/audio_duration.dart';

class AudioMediaFile extends StatefulWidget {
  final File file;

  const AudioMediaFile({super.key, required this.file});

  @override
  State<AudioMediaFile> createState() => _AudioMediaFileState();
}

class _AudioMediaFileState extends State<AudioMediaFile> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration? duration;

  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });

    player.setSource(DeviceFileSource(widget.file.path));
  }
  
  Future<void> toggleAudio() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.setVolume(1.0);

      await player.play(
        DeviceFileSource(widget.file.path),
      );
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:240,
      child: ListTile(
        minVerticalPadding:0,
        leading: CircleAvatar(
          backgroundColor:AppColor.warning,
          child: Icon(Icons.headphones,color:AppColor.background,size:20,),
        ),
        title:IconButton(
            onPressed: toggleAudio,
            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        ),
        subtitle:Text(formatDuration(duration)),
      ),
    );
  }
}