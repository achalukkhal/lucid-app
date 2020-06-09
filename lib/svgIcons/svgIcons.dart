import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcons {
  static const _iconsList = const [
    'assets/icons/bird.svg',
    'assets/icons/birds.svg',
    'assets/icons/jungle.svg',
    'assets/icons/rain.svg',
    'assets/icons/snow.svg',
    'assets/icons/special.svg',
    'assets/icons/thunder.svg',
    'assets/icons/waves.svg',
    'assets/icons/wind.svg',
  ];

  static Widget get bird {
    return SvgPicture.asset(
      _iconsList[0],
      color: Colors.white,
    );
  }

  static Widget get birds {
    return SvgPicture.asset(
      _iconsList[1],
      color: Colors.white,
    );
  }

  static Widget get jungle {
    return SvgPicture.asset(
      _iconsList[2],
      color: Colors.white,
    );
  }

  static Widget get rain {
    return SvgPicture.asset(
      _iconsList[3],
      color: Colors.white,
    );
  }

  static Widget get snow {
    return SvgPicture.asset(
      _iconsList[4],
      color: Colors.white,
    );
  }

  static Widget get special {
    return SvgPicture.asset(
      _iconsList[5],
      color: Colors.white,
    );
  }

  static Widget get thunder {
    return SvgPicture.asset(
      _iconsList[6],
      color: Colors.white,
    );
  }

  static Widget get wave {
    return SvgPicture.asset(
      _iconsList[7],
      color: Colors.white,
    );
  }

  static Widget get wind {
    return SvgPicture.asset(
      _iconsList[8],
      color: Colors.white,
    );
  }

  static Widget get lucidLogo {
    return SvgPicture.asset(
      'assets/logo/lucidMonogram.svg',
    );
  }
}
