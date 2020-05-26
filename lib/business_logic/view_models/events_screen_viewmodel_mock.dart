import 'package:flutter/material.dart';
import 'package:kwjsflutter/business_logic/view_models/events_screen_viewmodel.dart';
import 'package:kwjsflutter/services/events/events_api_mock.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';

class MockEventsScreenViewModel extends ChangeNotifier implements EventsScreenViewModel {
  final eventsService = MockEventsApi();

  List<Event> _events = [];
  List<Event> get events => _events;

  void loadEvents() async {
    _events = await eventsService.fetchEvents();
    notifyListeners();
  }
}