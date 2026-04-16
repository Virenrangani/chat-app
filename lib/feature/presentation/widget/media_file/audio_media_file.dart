import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:chat_demo/core/constant/colour/app_color.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/file_duration/file_duration.dart';

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
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });

      player.onPositionChanged.listen((p) {
        setState(() {
          position = p;
        });
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
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
    final extension= widget.file.path.split(".").last;
    return SizedBox(
      width:240,
      child: ListTile(
        minVerticalPadding:0,
        leading: CircleAvatar(
          backgroundColor:AppColor.warning,
          child: Icon(Icons.headphones,color:AppColor.background,size:20,),
        ),
        title:Row(
          children: [
            IconButton(
                onPressed: toggleAudio,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    value: (duration != null && duration!.inMilliseconds > 0)
                        ? position.inMilliseconds / duration!.inMilliseconds
                        : 0,
                    backgroundColor: Colors.grey.shade300,
                    color: AppColor.warning,
                    minHeight: 3,
                  ),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatDuration(position)),
                      Text(formatDuration(duration)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        subtitle:Text(extension),
      ),
    );
  }
}