import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationRotate;
  late Animation<double> _animationScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationRotate = Tween<double>(begin: 0, end: 2 * 3.14).animate(_controller);
    _animationScale = Tween<double>(begin: 1, end: 1.5).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationRotate,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animationScale.value,
                  child: Transform.rotate(
                    angle: _animationRotate.value,
                    child: child,
                  ),
                );
              },
              child: Icon(
                Icons.settings_outlined,
                size: 64,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Página en construcción',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
