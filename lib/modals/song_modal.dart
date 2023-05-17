import 'package:assets_audio_player/assets_audio_player.dart';

class SongModel {
  bool isPlay;
  bool isMute;
  AssetsAudioPlayer assetsAudioPlayer;
  Duration? totalDuration;
  Duration currentSliderValue;

  SongModel({
    required this.isPlay,
    required this.isMute,
    required this.assetsAudioPlayer,
    this.totalDuration,
    required this.currentSliderValue
  });
}

