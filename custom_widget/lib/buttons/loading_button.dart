import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final Function? onTap;

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Material(
          child: InkWell(
            onTap: () async {
              if (!_isLoading) {
                _isLoading = true;
                setState(() {});
                await widget.onTap?.call();
                _isLoading = false;
                setState(() {});
              }
            },
            child: Opacity(
              opacity: _isLoading ? 0.5 : 1,
              child: widget.child,
            ),
          ),
        ),
        if (_isLoading)
          const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              color: Colors.black12,
              strokeWidth: 3,
            ),
          ),
      ],
    );
  }
}
