// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';

import 'item_widget.dart';

enum InitialPositions { start, center, end }

class VerticalPicker extends StatefulWidget {
  final double minValue, maxValue;
  final int divisions;
  final double height;
  final double width;
  final Function(double) onChanged;
  final InitialPositions initialPosition;
  final Color backgroundColor;
  final bool showCursor;
  final Color cursorColor;
  final Color activeItemTextColor;
  final Color passiveItemsTextColor;
  final String suffix;

  VerticalPicker({
    required this.minValue,
    required this.maxValue,
    required this.divisions,
    required this.height,
    required this.onChanged,
    required this.width,
    this.initialPosition = InitialPositions.center,
    this.backgroundColor = Colors.white,
    this.showCursor = true,
    this.cursorColor = Colors.red,
    this.activeItemTextColor = Colors.blue,
    this.passiveItemsTextColor = Colors.grey,
    this.suffix = "",
  }) : assert(minValue < maxValue);

  @override
  _VerticalPickerState createState() => _VerticalPickerState();
}

class _VerticalPickerState extends State<VerticalPicker> {
  late FixedExtentScrollController _scrollController;
  late int curItem;
  List<Map> valueMap = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i <= widget.divisions; i++) {
      valueMap.add({
        "value": widget.minValue +
            ((widget.maxValue - widget.minValue) / widget.divisions) * i,
        "fontSize": 14.0,
        "color": widget.passiveItemsTextColor,
      });
    }
    setScrollController();
  }

  void setScrollController() {
    int initialItem;
    switch (widget.initialPosition) {
      case InitialPositions.start:
        initialItem = 0;
        break;
      case InitialPositions.center:
        initialItem = (valueMap.length ~/ 2);
        break;
      case InitialPositions.end:
        initialItem = valueMap.length - 1;
        break;
    }

    _scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      height: widget.height,
      width: widget.width,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 2,
            child: ListWheelScrollView(
                controller: _scrollController,
                itemExtent: 60,
                onSelectedItemChanged: (item) {
                  curItem = item;
                  int decimalCount = 1;
                  num fac = pow(10, decimalCount);
                  valueMap[item]["value"] =
                      (valueMap[item]["value"] * fac).round() / fac;
                  widget.onChanged(valueMap[item]["value"]);
                  for (var i = 0; i < valueMap.length; i++) {
                    if (i == item) {
                      valueMap[item]["color"] = widget.activeItemTextColor;
                      valueMap[item]["fontSize"] = 15.0;
                      valueMap[item]["hasBorders"] = true;
                    } else {
                      valueMap[i]["color"] = widget.passiveItemsTextColor;
                      valueMap[i]["fontSize"] = 14.0;
                      valueMap[i]["hasBorders"] = false;
                    }
                  }
                  setState(() {});
                },
                children: valueMap.map((Map curValue) {
                  return RotatedBox(
                    quarterTurns: 1,
                    child: ItemWidget(
                      curValue,
                      widget.backgroundColor,
                      widget.suffix,
                    ),
                  );
                }).toList()),
          ),
          Visibility(
            visible: widget.showCursor,
            child: RotatedBox(
              quarterTurns: 1,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: widget.cursorColor.withOpacity(0.3),
                  ),
                  width: 3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
