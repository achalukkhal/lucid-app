import 'package:flutter/material.dart';
import 'audioControllerModel.dart';
import 'audioSlider.dart';

class AudioControllerPanel extends StatefulWidget {
  final List<AudioControllerModel> _audioControllerList;
  AudioControllerPanel(audioControllerList) : this._audioControllerList = audioControllerList;

  @override
  _audioControllerPanelState createState() => _audioControllerPanelState();
}

class _audioControllerPanelState extends State<AudioControllerPanel> {
  List<Widget> _displayControls = [];

  @override
  void initState() {
    super.initState();
    widget._audioControllerList.forEach((control) {
      _displayControls.add(Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(12)),
          child:AudioSlider(control)
      ));
    });

  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      scrollDirection: Axis.horizontal,
      child: Row(children: _displayControls
      ),
    );
  }
}

