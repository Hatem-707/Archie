import 'package:feetly/models/camera_feed.dart';
import 'package:feetly/views/excercises_view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.exercise});
  final Exercise exercise;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      _videoController = VideoPlayerController.asset(widget.exercise.videoPath);
      await _videoController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: true,
        looping: true,
        showControls: true,
        placeholder: Center(child: CircularProgressIndicator()),
        autoInitialize: true,
        hideControlsTimer: Duration(seconds: 1),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error intializing player: $e');
      setState(() {
        _isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Exercise exercise = widget.exercise;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          exercise.name,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Chewie(controller: _chewieController),
                    ),
            ),
            Divider(
              height: 24,
              thickness: 3,
              color: theme.colorScheme.onSurface.withAlpha(100),
            ),
            Text(
              "What the exercise do?",
              style: theme.textTheme.headlineMedium!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Flexible(
              child: Text(
                exercise.details,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            Divider(
              height: 24,
              thickness: 3,
              color: theme.colorScheme.onSurface.withAlpha(100),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CameraFeed(exerciseTitle: exercise.name),
                    ),
                  );
                },
                child: Text("Exercise with an AI trainer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
