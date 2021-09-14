import 'package:fl02_lite/screens/ex1/common/screen_size.dart';
import 'package:fl02_lite/screens/ex1/stop_watch/widgets/start_button.dart';
import 'package:fl02_lite/screens/ex1/stop_watch/widgets/wrap_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height(context) * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WrapButton(),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 10, color: Colors.white),
                const SizedBox(width: 6),
                Icon(Icons.circle,
                    size: 10, color: Colors.white.withOpacity(0.3)),
              ],
            ),
          ),
          StartButton(),
        ],
      ),
    );
  }
}
