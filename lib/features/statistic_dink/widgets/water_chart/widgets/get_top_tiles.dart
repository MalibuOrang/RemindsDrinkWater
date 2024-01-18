import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget getTopTitle(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  Widget text;
  double textValue = 2500;
  switch (value.toInt()) {
    case 0:
      text = Text(
        '$textValue',
        style: style,
      );
      break;
    case 1:
      text = Text(
        '$textValue',
        style: style,
      );
      break;
    case 2:
      text = Text(
        '$textValue',
        style: style,
      );
      break;
    case 3:
      text = Text(
        '$textValue',
        style: style,
      );
      break;
    case 4:
      text = Text(
        '$textValue',
        style: style,
      );
      break;
    case 5:
      text = Text(
        '$textValue',
        style: style,
      );
      break;
    case 6:
      text = Text(
        '$textValue',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
