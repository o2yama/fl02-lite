import 'package:fl02_lite/screens/ex0/page_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  PageTwo(this.contentHeight);
  final double contentHeight;

  static Route<Widget> route(double contentHeight) {
    return MaterialPageRoute<Widget>(builder: (_) => PageTwo(contentHeight));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            previousPageTitle: 'Root',
            largeTitle: Text('Two'),
            border: Border(bottom: BorderSide.none),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => SizedBox(
                height: contentHeight,
                child: CupertinoButton(
                  child: Text('Hello, World #2!'),
                  onPressed: () =>
                      Navigator.push(context, PageThree.route(contentHeight)),
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
