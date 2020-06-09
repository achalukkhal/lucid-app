import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'audioControlPanel.dart';
import 'audioControllerModel.dart';
import 'svgIcons/svgIcons.dart';

void main() => runApp(MyApp());

const appGlobalBackGroundColor = Color.fromRGBO(17, 17, 17, 1.0);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'LUCID',
      debugShowCheckedModeBanner: false,
      color: appGlobalBackGroundColor,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  bool isPlaying = false;

  List<AudioControllerModel> _audioControllerList;

  List<AudioPlayer> advancedPlayer;
  List<AudioCache> audioCache;

  final FlareControls _flareControls = FlareControls();

  double get audioVolume {
    return _audioControllerList[0].value;
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    _audioControllerList = [
      AudioControllerModel(
          id: UniqueKey(),
          value: 0.3,
          icon: SvgIcons.bird,
          audio: 'audio/birds.mp3'),
      AudioControllerModel(
          id: UniqueKey(),
          value: 0.4,
          icon: SvgIcons.birds,
          audio: 'audio/chorus.mp3'),
      AudioControllerModel(
          id: UniqueKey(),
          value: 0.3,
          icon: SvgIcons.jungle,
          audio: 'audio/chorus2.mp3'),
      AudioControllerModel(
          id: UniqueKey(),
          value: 0.5,
          icon: SvgIcons.rain,
          audio: 'audio/rain.mp3'),
      AudioControllerModel(
          id: UniqueKey(),
          value: 0.6,
          icon: SvgIcons.thunder,
          audio: 'audio/thunder.mp3'),
      AudioControllerModel(
          id: UniqueKey(),
          value: 0.4,
          icon: SvgIcons.wave,
          audio: 'audio/waves.mp3'),
      AudioControllerModel(
          id: UniqueKey(),
          value: 0.6,
          icon: SvgIcons.wind,
          audio: 'audio/wind.mp3'),
    ];

    _audioControllerList.forEach((element) {
      element.audioCache.load(element.audio);
    });
  }

  void _playAppAudios() {
    setState(() {
      if (!isPlaying) {
        _audioControllerList.forEach((element) {
          element.audioCache.play(element.audio);
        });
        _flareControls.play('go');
      } else {
        _audioControllerList.forEach((element) {
          element.advancedPlayer.stop();
        });
        _flareControls.play('idle');
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgIcons.lucidLogo,
            SizedBox(
              width: 10,
            ),
            Center(
                child: const Text('LUCID',
                    style: TextStyle(
                        fontFamily: 'SpaceMono',
                        color: Color.fromRGBO(92, 212, 214, 1.0)))),
          ],
        ),
        elevation: 0.0,
        backgroundColor: appGlobalBackGroundColor,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [appGlobalBackGroundColor, appGlobalBackGroundColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: FlareActor(
                      "assets/flare/white_moon.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: 'go',
                      isPaused: !isPlaying,
                    ),
                  ),
                  Text(isPlaying ? 'Relax!' : 'Hello',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontFamily: 'SpaceMono',
                          fontSize: 26,
                          color: Color.fromRGBO(92, 212, 214, 1.0))),
                ],
              ),
              AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                secondChild: const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Cognitive processing is easily affected by environmental stimulation that '
                    'distracts attention. lucid is a mindful implication of brown noise for better concentration and relaxation. '
                    'lucid uses the baseline of how our brains respond as we complete tasks in different environments by '
                    'changing background noises.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontFamily: 'SpaceMono', color: Colors.white),
                  ),
                ),
                firstChild: AudioControllerPanel(_audioControllerList),
                crossFadeState: isPlaying
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        child: FlatButton(
          onPressed: _playAppAudios,
          padding: const EdgeInsets.all(18),
          color: const Color.fromRGBO(31, 204, 181, 1.0),
          child: Text(isPlaying ? 'STOP' : 'PLAY',
              style: TextStyle(
                  fontFamily: 'SpaceMono', fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    if (isPlaying) {
      _audioControllerList.forEach((element) {
        element.advancedPlayer.stop();
      });
      _flareControls.play('idle');
      isPlaying = false;
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _audioControllerList.forEach((element) {
      element.audioCache.clearCache();
      element.advancedPlayer.dispose();
    });
    super.dispose();
  }
}
