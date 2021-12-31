import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: LoadingButton(
                primaryColor: Colors.black,
                secondaryColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () async {
                  await Future.delayed(Duration(seconds: 2));
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: LoadingButton(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Text('button title'),
                ),
                onTap: () async {
                  await Future.delayed(Duration(seconds: 2));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    Key key,
    this.child,
    this.onTap,
    this.primaryColor,
    this.secondaryColor,
  }) : super(key: key);

  final Widget child;
  final Function onTap;
  final Color primaryColor;
  final Color secondaryColor;

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
          color: _isLoading
              ? widget.secondaryColor ?? Colors.red
              : widget.primaryColor ?? Colors.red,
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
              child: widget?.child ?? const SizedBox.shrink(),
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
