

import 'package:flutter/material.dart';

import 'audioControllerModel.dart';

class AudioSlider extends StatefulWidget {
  final AudioControllerModel control;
  AudioSlider(this.control);

  @override
  _AudioSliderState createState() => _AudioSliderState();
}

class _AudioSliderState extends State<AudioSlider> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Slider(
            key: ObjectKey(widget.control),
            min: 0.0,
            max: 1.0,
            activeColor: Colors.white70,
            inactiveColor: Colors.white30,
            value: widget.control.value,
            onChanged: (newValue) => {
              setState(() {
                widget.control.value = double.parse(newValue.toStringAsFixed(1));
                widget.control.advancedPlayer.setVolume(widget.control.value );
              })
            },
          ),
        ),
        SizedBox(
          height: 25,
          child: widget.control.icon,
        )
      ],
    );
  }
}
