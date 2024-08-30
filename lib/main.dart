import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Kotlin Integration'),
        ),
        body: Center(
          child: SquareAndActivityButtons(),
        ),
      ),
    );
  }
}

class SquareAndActivityButtons extends StatefulWidget {
  @override
  _SquareAndActivityButtonsState createState() =>
      _SquareAndActivityButtonsState();
}

class _SquareAndActivityButtonsState extends State<SquareAndActivityButtons> {
  static const squareChannel = MethodChannel(
      'com.example.customkotlinswift/square');
  static const activityChannel = MethodChannel(
      'com.example.customkotlinswift/activity');

  int? _squareResult;

  Future<void> _getSquare(int number) async {
    try {
      final int result = await squareChannel.invokeMethod(
          'getSquare', {"number": number});
      setState(() {
        _squareResult = result;
      });
    } on PlatformException catch (e) {
      print("Failed to get square: '${e.message}'.");
    }
  }

  Future<void> _startNewActivity() async {
    try {
      await activityChannel.invokeMethod('startNewActivity');
    } on PlatformException catch (e) {
      print("Failed to start activity: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            if (Platform.isAndroid) {
              _getSquare(5);
            } else {
              _getSquare(5);
            }
          },
          child: Text('Calculate Square of 5'),
        ),
        if (_squareResult != null)
          Text('Square: $_squareResult'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (Platform.isAndroid) {
              _startNewActivity();
            } else {
              _startNewActivity();
            }
          },
          child: Text('Start New Activity'),
        ),
      ],
    );
  }
}
