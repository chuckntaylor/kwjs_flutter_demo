import 'package:flutter/material.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';
abstract class EventsScreenViewModel extends ChangeNotifier {
  List<Event> get events;
  void loadEvents();
}