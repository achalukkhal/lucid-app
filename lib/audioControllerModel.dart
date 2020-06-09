
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class AudioControllerModel {
  dynamic icon;
  String audio;
  UniqueKey id;
  double value = 0.5;
  AudioPlayer advancedPlayer = new AudioPlayer();
  AudioCache audioCache;

  AudioControllerModel({
    this.id,
    this.icon,
    this.audio,
    this.value
  }) {
    this.audioCache = new AudioCache(fixedPlayer: advancedPlayer);
  }
}