import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(child: Image.asset('assets/images/logo.png')));
  }
}
