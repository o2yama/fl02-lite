import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stopWatchModelProvider =
    ChangeNotifierProvider((ref) => StopWatchModel());

class StopWatchModel extends ChangeNotifier {
  String timeDisplay = '00:00.00';

  int millSecond = 0;
  int second = 0;
  int minute = 0;
  int hour = 0;

  var isRunning = false;
  var wrapButtonColor = CupertinoColors.systemGrey.withOpacity(0.2);
  var wrapButtonText = 'ラップ';
  var wrapButtonTextColor = CupertinoColors.systemGrey;
  var startButtonColor = CupertinoColors.activeGreen;
  var startButtonText = '開始';

  Stream<int> watchMillSecond() {
    return Stream.periodic(
      Duration(milliseconds: 10),
      (_) {
        millSecond += 1;
        if (millSecond == 100) {
          millSecond = 0;
          second += 1;
          if (second == 60) {
            second = 0;
            minute += 1;
            if (minute == 60) {
              minute = 0;
              hour += 1;
            }
          }
        }
        if (minute >= 30) {
          timeDisplay = '${hour.toString().padLeft(2, '0')}'
              ':${minute.toString().padLeft(2, '0')}'
              ':${second.toString().padLeft(2, '0')}';
        } else {
          timeDisplay = '${minute.toString().padLeft(2, '0')}'
              ':${second.toString().padLeft(2, '0')}'
              '.${millSecond.toString().padLeft(2, '0')}';
        }
        return millSecond;
      },
    );
  }

  void start() {
    isRunning = true;
    startButtonColor = CupertinoColors.systemRed;
    startButtonText = '停止';
    wrapButtonColor = CupertinoColors.systemGrey.withOpacity(0.3);
    wrapButtonText = 'ラップ';
    wrapButtonTextColor = CupertinoColors.systemBackground;
    notifyListeners();
  }

  void stop() {
    isRunning = false;
    startButtonColor = CupertinoColors.activeGreen;
    startButtonText = '開始';
    wrapButtonText = 'リセット';
    notifyListeners();
  }

  void resetTimer() {
    millSecond = 0;
    second = 0;
    minute = 0;
    hour = 0;
    timeDisplay = '00:00.00';
    wrapButtonColor = CupertinoColors.systemGrey.withOpacity(0.2);
    wrapButtonText = 'ラップ';
    wrapButtonTextColor = CupertinoColors.systemGrey;
    notifyListeners();
  }
}
