import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
          child: Center(
        child: new Text(data),
      )),
    );
  }
}
