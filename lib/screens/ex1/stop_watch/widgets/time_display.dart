import 'dart:ui';
import 'package:fl02_lite/screens/ex1/common/screen_size.dart';
import 'package:fl02_lite/screens/ex1/stop_watch/stop_watch_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeDisplay extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _stopWatchModel = useProvider(stopWatchModelProvider);

    return SizedBox(
      height: ScreenSize.height(context) * 0.4,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: StreamBuilder<int>(
              stream: _stopWatchModel.isRunning
                  ? _stopWatchModel.watchMillSecond()
                  : null,
              builder: (context, snapshot) {
                return Text(
                  '${_stopWatchModel.timeDisplay}',
                  style: TextStyle(
                    fontFeatures: [FontFeature.tabularFigures()],
                    color: Colors.white,
                    fontSize: 75,
                    fontWeight: FontWeight.w200,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
