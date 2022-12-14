

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayer extends StatefulWidget {
  static const routeName="Video Player";
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  bool back=false;
  @override
  Widget build(BuildContext context) {
  final controller=ModalRoute.of(context)!.settings.arguments as YoutubePlayerController;
   return YoutubePlayer(
      controller: controller,
      aspectRatio: 16 / 9,

    );



  }
}
