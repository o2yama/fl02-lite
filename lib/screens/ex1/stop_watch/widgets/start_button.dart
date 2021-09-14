import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../stop_watch_model.dart';

class StartButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _stopWatchModel = useProvider(stopWatchModelProvider);

    return GestureDetector(
      onTap: () => _stopWatchModel.isRunning
          ? _stopWatchModel.stop()
          : _stopWatchModel.start(),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: CupertinoColors.black,
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(
                      color: _stopWatchModel.startButtonColor.withOpacity(0.2),
                      width: 2),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: _stopWatchModel.startButtonColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Center(
                  child: Text(
                    _stopWatchModel.startButtonText,
                    style: TextStyle(
                        color: _stopWatchModel.startButtonColor, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
