import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:kwjsflutter/business_logic/models/event.dart';
import 'events_api.dart';

class MockEventsApi implements EventsApi {

  @override
  Future<List<Event>> fetchEvents() async {

    final jsonObject = await rootBundle.loadString('assets/fixtures/events.json');
    List<Event> events = [];

    events.add(Event.fromJson(
      json.decode(jsonObject)[0]
    ));

    return events;
  }
}