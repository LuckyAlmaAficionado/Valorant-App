import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/video_controller.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: const Text('Preview Weapon'),
        backgroundColor: Colors.black12,
        centerTitle: true,
      ),
      body: Obx(() => (controller.checkIsLoading.value)
          ? Center(
              child: controller.videoController.value.isInitialized
                  ? GestureDetector(
                      onDoubleTap: () =>
                          controller.videoController.seekTo(Duration.zero),
                      onTap: () => controller.pauseAndPlay(),
                      child: AspectRatio(
                        aspectRatio:
                            controller.videoController.value.aspectRatio,
                        child: VideoPlayer(controller.videoController),
                      ),
                    )
                  : Container(
                      child: Text('tidak ada video'),
                    ),
            )
          : Center(child: CircularProgressIndicator())),
    );
  }
}
