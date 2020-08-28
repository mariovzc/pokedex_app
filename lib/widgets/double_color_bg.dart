import 'package:flutter/material.dart';

class DoubleColorBg extends StatelessWidget {
  final List<Color> colors;

  const DoubleColorBg(
      {Key key, this.colors = const [Colors.white, Colors.black]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgOpacity = 0.8;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black87,
      child: Row(
        children: colors
            .map((color) => Expanded(
                  child: Container(
                    color: color.withOpacity(bgOpacity),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
