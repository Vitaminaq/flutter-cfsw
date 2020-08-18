import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class LocalVideoPlayerPage extends StatelessWidget {
  final dynamic params;

  LocalVideoPlayerPage(this.params);

  @override
  Widget build(BuildContext context) {
    final String url = params['url'] == null ? '' : params['url'];
    return LocalVideoPlayer(
      url: url,
    );
  }
}

class LocalVideoPlayer extends StatefulWidget {
  final String url;
  LocalVideoPlayer({@required this.url}) : assert(url != null);

  @override
  _LocalVideoPlayerState createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff00c295),
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
