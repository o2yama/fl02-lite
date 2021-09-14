import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return SizedBox(height: 50);
        },
        separatorBuilder: (context, index) =>
            Divider(color: Colors.grey.shade700, height: 1),
        itemCount: 10, //ラップした数
      ),
    );
  }
}
