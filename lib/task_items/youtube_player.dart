import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String videoUrl;
  final double height;
  final bool autoPlay;

  const CustomYoutubePlayer({
    Key? key,
    required this.videoUrl,
    this.height = 220.0,
    this.autoPlay = false,
  }) : super(key: key);

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;
  late String _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = _extractVideoId(widget.videoUrl);
    _initializeController();
  }

  String _extractVideoId(String url) {
    // Handle full YouTube URLs
    if (url.contains('youtube.com')) {
      return YoutubePlayer.convertUrlToId(url) ?? '';
    }
    // Handle youtu.be URLs
    else if (url.contains('youtu.be')) {
      return url.split('/').last;
    }
    // Assume the provided string is already a video ID
    return url;
  }

  void _initializeController() {
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _videoId.isEmpty
        ? const Center(child: Text('Invalid YouTube URL'))
        : Container(
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.redAccent,
                ),
              ),
            ),
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
