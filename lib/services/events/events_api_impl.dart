import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kwjsflutter/config/config.dart';
import 'package:kwjsflutter/services/events/events_api.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';

class EventsApiImpl implements EventsApi {

  final _host = Config.host;
  final _path = Config.eventsPath;
  final Map<String, String> _headers = {'Accept': 'application/json'};

  List<Event> _eventsCache;

  @override
  Future<List<Event>> fetchEvents() async {
    if (_eventsCache == null) {
      print('getting events from API');
      final uri = Uri.https(_host, _path);
      final response = await http.get(uri);
      final jsonObject = json.decode(response.body);
      _eventsCache = _createEventsListFromRawMap(jsonObject);
    } else {
      print('getting events from cache');
    }
    return _eventsCache;
  }

  List<Event> _createEventsListFromRawMap(List jsonObject) {
    List<Event> list = [];

    for (var event in jsonObject) {
      list.add(Event.fromJson(event));
    }

    return list;
  }
}