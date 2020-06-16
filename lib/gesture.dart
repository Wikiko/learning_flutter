import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureExample extends StatelessWidget {
  void showToast(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gestures'),
        ),
        body: Builder(
            builder: (innerContext) => GestureDetector(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'Tap, Long Press, Swipe Horizontally or Vertically')
                      ],
                    ),
                  ),
                  onTap: () {
                    showToast(innerContext, 'Tapped');
                  },
                  onLongPress: () {
                    showToast(innerContext, 'Long Pressed');
                  },
                  onHorizontalDragEnd: (DragEndDetails value) {
                    showToast(innerContext, 'Swiped Horizontally');
                  },
                  onVerticalDragEnd: (DragEndDetails value) {
                    showToast(innerContext, 'Swiped Vertically');
                  },
                )));
  }
}
