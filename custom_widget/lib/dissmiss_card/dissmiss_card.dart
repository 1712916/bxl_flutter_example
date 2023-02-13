import 'package:flutter/material.dart';

class DissmissCard extends StatefulWidget {
  final double height;
  final BorderRadius borderRadius;
  final Widget child;
  final Color color;
  final List<Widget> actions;
  final bool removeMode;

  const DissmissCard({
    Key? key,
    this.color = Colors.white,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    required this.child,
    required this.actions,
    this.removeMode = false,
  }) : super(key: key);

  @override
  _DissmissCardState createState() => _DissmissCardState();
}

class _DissmissCardState extends State<DissmissCard> {
  static const AlignmentGeometry _leftAlignment = Alignment.topLeft;
  static const AlignmentGeometry _rightAlignment = Alignment.topRight;
  static const Duration _duration0 = Duration(milliseconds: 0);
  static const Duration _durationEnd = Duration(milliseconds: 210);
  static const double _opacityWhenDrag = 0.8;
  static const double _opacityInit = 1;

  final GlobalKey _actionsKey = GlobalKey();

  double _actionsWidth = 0;
  double _preLeft = 0;
  double _left = 0;
  double _start = 0;
  double _opacity = _opacityInit;
  bool _isHideAction = true;
  AlignmentGeometry _alignment = _leftAlignment;
  bool _isRemove = false;
  Duration _duration = _duration0;
  double _width = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _actionsWidth = _actionsKey.currentContext?.size?.width ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isRemove
        ? const SizedBox.shrink()
        : ClipRRect(
            borderRadius: widget.borderRadius,
            child: LayoutBuilder(
              builder: (context, constraints) {
                _width = constraints.maxWidth;
                return SizedBox(
                  width: _width,
                  child: Stack(
                    alignment: _alignment,
                    children: [
                      IgnorePointer(
                        child: Opacity(
                          opacity: 0,
                          child: widget.child,
                        ),
                      ),
                      Visibility(
                        maintainState: true,
                        visible: !_isHideAction,
                        child: Row(
                          key: _actionsKey,
                          mainAxisSize: MainAxisSize.min,
                          children: widget.actions,
                        ),
                      ),
                      AnimatedPositioned(
                        width: _width,
                        duration: _duration,
                        left: _left,
                        child: GestureDetector(
                          onHorizontalDragStart: _onHorizontalDragStart,
                          onHorizontalDragEnd: _onHorizontalDragEnd,
                          onHorizontalDragUpdate: _onHorizontalDragUpdate,
                          child: ClipRRect(
                            borderRadius: widget.borderRadius,
                            child: ColoredBox(
                              color: widget.color.withOpacity(_opacity),
                              child: widget.child,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }

  void _onHorizontalDragUpdate(DragUpdateDetails dragUpdateDetails) {
    final changeDistancePosition = dragUpdateDetails.localPosition.dx - _start;
    _left = _preLeft + changeDistancePosition;

    if (_left.abs() > _actionsWidth / 2 && _isHideAction) {
      if (dragUpdateDetails.delta.dx < 0) {
        _alignment = _rightAlignment;
      } else {}
      _isHideAction = false;
    } else if (_left > _actionsWidth / 2 && !_isHideAction && _alignment == _rightAlignment) {
      _alignment = _leftAlignment;
    } else if (_left < -_actionsWidth / 2 && !_isHideAction && _alignment == _leftAlignment) {
      _alignment = _rightAlignment;
    }
    setState(() {});
  }

  void _onHorizontalDragEnd(DragEndDetails dragEndDetails) {
    if (_left.abs() > (_width * 0.65)) {
      _isHideAction = true;
      _left = 0;
      _isRemove = true && widget.removeMode;
    } else if (_left.abs() < _actionsWidth / 2) {
      _isHideAction = true;
      _left = 0;
    } else {
      _left = (_left / _left.abs()) * (_actionsWidth);
      _isHideAction = false;
    }
    _preLeft = _left;
    _duration = _durationEnd;
    _opacity = _opacityInit;
    setState(() {});
  }

  void _onHorizontalDragStart(DragStartDetails dragStartDetails) {
    _start = dragStartDetails.localPosition.dx;
    _duration = _duration0;
    _opacity = _opacityWhenDrag;
    setState(() {});
  }
}
