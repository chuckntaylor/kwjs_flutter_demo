import 'package:flutter/material.dart';
import 'package:kwjsflutter/services/service_locator.dart';
import 'package:kwjsflutter/ui/views/events_screen.dart';

void main() {
  setupServiceLocator();
  runApp(KWJSApp());
}

class KWJSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KWJSFlutter',
      home: EventsScreen()
    );
  }
}
