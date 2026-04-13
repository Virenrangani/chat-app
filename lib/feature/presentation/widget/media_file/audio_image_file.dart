import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioImageFile extends StatefulWidget {
  final File file;

  const AudioImageFile({super.key, required this.file});

  @override
  State<AudioImageFile> createState() => _AudioImageFileState();
}

class _AudioImageFileState extends State<AudioImageFile> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

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
        leading: const Icon(Icons.audio_file, color: Colors.blue),

        title: Text(
          widget.file.path.split('/').last,
          overflow: TextOverflow.ellipsis,
        ),

        subtitle: IconButton(
          onPressed: toggleAudio,
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ),
    );
  }
}