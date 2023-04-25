import 'package:flutter/material.dart';

class BorderFieldWidget extends StatelessWidget {
  const BorderFieldWidget({Key? key, required this.child, this.onTap, this.isEnable = true}) : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? () => onTap?.call() : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: Colors.grey.shade200)),
          borderRadius: BorderRadius.circular(4),
          color: isEnable ? null : Colors.grey.shade200,
        ),
        child: child,
      ),
    );
  }
}

class CustomDropdownButton<T> extends StatefulWidget {
  final int? initial;
  final List<T> items;
  final ValueChanged<int>? onChange;
  final Widget Function(T item, bool isSelected) itemBuilder;
  final Widget Function(T item) title;

  CustomDropdownButton({
    Key? key,
    this.initial,
    required this.items,
    required this.itemBuilder,
    required this.title,
    this.onChange,
  }) : super(key: key) {
    assert(items.isNotEmpty);
    if (initial != null) {
      assert(initial! <= items.length);
    }
  }

  @override
  State<CustomDropdownButton<T>> createState() => _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  final ValueNotifier<bool> _openNotifier = ValueNotifier(false);
  late ValueNotifier<int> _currentIndexNotifier;

  @override
  void initState() {
    super.initState();
    _currentIndexNotifier = ValueNotifier(widget.initial ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return DropDownOverlayView(
      openNotifier: _openNotifier,
      builder: (context) => ValueListenableBuilder<int>(
        valueListenable: _currentIndexNotifier,
        builder: (_, val, __) => ListView.separated(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => TextButton(
            onPressed: () {
              if (index == val) {
                return;
              }
              _itemSelected(index);
            },
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              padding: EdgeInsets.zero,
            ),
            child: widget.itemBuilder(widget.items[index], index == _currentIndexNotifier.value),
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox.shrink(),
          itemCount: widget.items.length,
        ),
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: _openNotifier,
        builder: (_, val, __) {
          return BorderFieldWidget(
            onTap: () async {
              _openNotifier.value = !val;
            },
            child: Row(
              children: [
                Expanded(
                  child: widget.title(widget.items[_currentIndexNotifier.value]),
                ),
                if (val)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 1,
                    height: 20,
                    color: const Color(0xFFCFD2D4),
                  ),
                AnimatedRotation(
                  turns: val ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 24,
                    color: Color(0xFF3F4B53),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _itemSelected(int index) {
    _currentIndexNotifier.value = index;
    _openNotifier.value = false;
    widget.onChange?.call(index);
  }

  @override
  void dispose() {
    _openNotifier.dispose();
    _currentIndexNotifier.dispose();
    super.dispose();
  }
}

class DropDownOverlayView extends StatefulWidget {
  final Widget child;
  final ValueChanged<bool>? onToggle;
  final BorderRadius? borderRadius;
  final Color bgColor;
  final Color? borderColor;
  final double? elevation;
  final WidgetBuilder? builder;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final ValueNotifier<bool> openNotifier;

  const DropDownOverlayView({
    Key? key,
    required this.child,
    this.onToggle,
    this.borderRadius,
    this.bgColor = const Color(0xFFFFFFFF),
    this.borderColor,
    this.elevation,
    this.builder,
    this.constraints,
    required this.openNotifier,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  State<DropDownOverlayView> createState() => _DropDownOverlayViewState();
}

class _DropDownOverlayViewState extends State<DropDownOverlayView> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late final ValueNotifier<bool> _openNotifier;

  late final AnimationController _animationController;
  late final Animation<double> _expandAnimation;

  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _openNotifier = widget.openNotifier;
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _openNotifier.addListener(_animationListener);
  }

  _animationListener() {
    if (_openNotifier.value) {
      _overlayEntry = _createOverlayEntry(context);
      Overlay.of(context)?.insert(_overlayEntry!);
      _animationController.forward();
    } else {
      _animationController.reverse().then((value) {
        if (_overlayEntry?.mounted ?? false) {
          _overlayEntry?.remove();
        }
        _overlayEntry = null;
      });
    }
    widget.onToggle?.call(_openNotifier.value);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _toggle(),
        child: widget.child,
      ),
    );
  }

  void _toggle() {
      if (mounted) {
      if (_animationController.isAnimating) {
        return;
      }
      _openNotifier.value = !_openNotifier.value;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _openNotifier.removeListener(_animationListener);
    super.dispose();
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final size = renderBox?.size ?? const Size(0, 0);
    final offset = renderBox?.localToGlobal(Offset.zero) ?? const Offset(0, 0);
    final topOffset = offset.dy + size.height + 5;
    final sz = MediaQuery.of(context).size;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _toggle(),
        behavior: HitTestBehavior.translucent,
        child: CompositedTransformFollower(
          offset: Offset(0, size.height),
          link: _layerLink,
          showWhenUnlinked: false,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              Positioned(
                left: -offset.dx,
                width: sz.width,
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.none,
                  elevation: 0,
                  child: SizeTransition(
                    axisAlignment: 1,
                    sizeFactor: _expandAnimation,
                    child: Container(
                      padding: widget.padding,
                      width: size.width,
                      margin: EdgeInsets.fromLTRB(offset.dx, 4, offset.dx, offset.dx),
                      constraints: widget.constraints ??
                          BoxConstraints(
                            minHeight: 40,
                            maxHeight: sz.height - topOffset - 15,
                          ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.04), offset: const Offset(0, -2), blurRadius: 4),
                          BoxShadow(color: Colors.black.withOpacity(0.12), offset: const Offset(0, 4), blurRadius: 8),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: widget.builder?.call(context) ?? const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
