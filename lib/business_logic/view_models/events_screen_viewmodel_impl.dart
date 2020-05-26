import 'package:flutter/material.dart';
import 'package:kwjsflutter/services/events/events_api.dart';
import 'package:kwjsflutter/services/service_locator.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';

import 'events_screen_viewmodel.dart';

class EventsScreenViewModelImpl extends ChangeNotifier implements EventsScreenViewModel {

  final _eventsService = serviceLocator<EventsApi>();

  List<Event> _events = [];
  List<Event> get events => _events;

  void loadEvents() async {
    _events = await _eventsService.fetchEvents();
    notifyListeners();
  }
}