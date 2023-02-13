import 'package:flutter/material.dart';

class SingleSelectionWidget<T> extends StatefulWidget {
  const SingleSelectionWidget({Key? key, required this.list, required this.builder, this.onSelected, this.initIndex}) : super(key: key);

  final List<T> list;
  final Widget Function(T item, bool isSelected) builder;
  final ValueChanged<T>? onSelected;
  final int? initIndex;

  @override
  State<SingleSelectionWidget<T>> createState() => _SingleSelectionWidgetState<T>();
}

class _SingleSelectionWidgetState<T> extends State<SingleSelectionWidget<T>> {
  int _currentSelected = -1;

  @override
  void initState() {
    super.initState();
    if (widget.initIndex != null) {
      _currentSelected = widget.initIndex!;
    }
  }

  @override
  void didUpdateWidget(covariant SingleSelectionWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initIndex != _currentSelected) {
      _currentSelected = widget.initIndex ?? -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.list.length,
        (index) {
          return InkWell(
            onTap: () {
              _currentSelected = index;
              setState(() {});
              widget.onSelected?.call(widget.list[index]);
            },
            child: widget.builder(widget.list[index], _currentSelected == index),
          );
        },
      ),
    );
  }
}

class MultiSelectionWidget<T> extends StatefulWidget {
  const MultiSelectionWidget({Key? key, required this.list, required this.builder, this.onSelected, this.initIndex, this.maxSelect}) : super(key: key);

  final List<T> list;
  final Widget Function(T item, bool isSelected) builder;
  final ValueChanged<List<int>>? onSelected;
  final List<int>? initIndex;
  final int? maxSelect;

  @override
  State<MultiSelectionWidget<T>> createState() => _MultiSelectionWidgetState<T>();
}

class _MultiSelectionWidgetState<T> extends State<MultiSelectionWidget<T>> {
  final Map<int, bool> _selectionList = {};

  @override
  void initState() {
    super.initState();
    widget.initIndex?.forEach((index) {
      _selectionList[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.list.length,
        (index) {
          return InkWell(
            onTap: () {
              if (widget.maxSelect != null) {
                if (_selectionList.keys.length >= widget.maxSelect!) {
                  return;
                }
              }
              if (_selectionList.containsKey(index)) {
                _selectionList.remove(index);
              } else {
                _selectionList[index] = true;
              }

              setState(() {});
              widget.onSelected?.call(_selectionList.keys.toList());
            },
            child: widget.builder(widget.list[index], _selectionList.containsKey(index)),
          );
        },
      ),
    );
  }
}
