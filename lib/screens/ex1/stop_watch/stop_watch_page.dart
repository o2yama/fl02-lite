import 'package:fl02_lite/screens/ex1/stop_watch/widgets/button_row.dart';
import 'package:fl02_lite/screens/ex1/stop_watch/widgets/time_display.dart';
import 'package:fl02_lite/screens/ex1/stop_watch/widgets/wrap_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StopWatchPage extends HookWidget {
  final bottomNavigatorItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.globe),
      label: '世界時計',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.alarm),
      label: 'アラーム',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.stopwatch_fill),
      label: 'ストップウォッチ',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.timer),
      label: 'タイマー',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final _index = useState(0);

    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.black,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TimeDisplay(),
              ButtonRow(),
              WrapList(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _index.value = index,
          currentIndex: _index.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: CupertinoColors.black,
          showUnselectedLabels: true,
          unselectedFontSize: 10,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.orange,
          selectedFontSize: 10,
          items: bottomNavigatorItems,
        ),
      ),
    );
  }
}
