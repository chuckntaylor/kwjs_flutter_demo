import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:kwjsflutter/business_logic/models/event.dart';
import 'events_api.dart';

class MockEventsApi implements EventsApi {

  @override
  Future<List<Event>> fetchEvents() async {

    final jsonRawObject = await rootBundle.loadString('assets/fixtures/events.json');
    final jsonObject = json.decode(jsonRawObject);
    List<Event> events = [];

    for (var event in jsonObject) {
      events.add(Event.fromJson(event));
    }

    return events;
  }
}