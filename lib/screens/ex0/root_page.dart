import 'package:fl02_lite/screens/ex0/page_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  static Route<Widget> route() {
    return MaterialPageRoute<Widget>(builder: (_) => RootPage());
  }

  @override
  Widget build(BuildContext context) {
    final contentHeight = MediaQuery.of(context).size.height - 200;

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Root'),
            border: Border(bottom: BorderSide.none),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => SizedBox(
                height: contentHeight,
                child: CupertinoButton(
                  child: Text('Hello, World!'),
                  onPressed: () =>
                      Navigator.push(context, PageTwo.route(contentHeight)),
                ),
              ),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
