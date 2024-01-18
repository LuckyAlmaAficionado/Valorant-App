import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoController;
  var checkIsLoading = false.obs;
  var checkIsPlay = true.obs;

  void initializeVideoPlayer(String videoUrl) {
    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((value) {
        videoController.play();
        checkIsLoading.value = true;
        checkIsLoading.refresh();
      });
  }

  pauseAndPlay() {
    if (checkIsPlay.value)
      videoController.pause();
    else
      videoController.play();

    checkIsPlay.value = !checkIsPlay.value;
  }

  @override
  void onInit() {
    super.onInit();
    initializeVideoPlayer(Get.arguments);
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
