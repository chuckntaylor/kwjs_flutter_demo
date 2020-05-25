import 'package:kwjsflutter/business_logic/models/event.dart';

abstract class EventsApi {
  Future<List<Event>> fetchEvents();
}