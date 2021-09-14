import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PageThree extends StatelessWidget {
  PageThree(this.contentHeight);
  final double contentHeight;

  static Route<Widget> route(double contentHeight) {
    return MaterialPageRoute<Widget>(builder: (_) => PageThree(contentHeight));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            previousPageTitle: 'Two',
            largeTitle: Text('Three'),
            border: Border(bottom: BorderSide.none),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => SizedBox(
                height: contentHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(child: Text('taisei_otsuyama #3!')),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.popUntil(
                            context, (Route<dynamic> route) => route.isFirst);
                      },
                      padding: EdgeInsets.zero,
                      child: Text('Pop to root'),
                    ),
                  ],
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
