import 'package:flutter_test/flutter_test.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';
import 'package:kwjsflutter/services/events/events_api.dart';
import 'package:kwjsflutter/services/events/events_api_mock.dart';
import 'package:kwjsflutter/services/service_locator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    setupServiceLocator();
    serviceLocator.allowReassignment = true;
  });

  test('Constructing Service should find correct dependencies', () {
    var eventsApi = MockEventsApi();
    expect(eventsApi != null, true);
  });

  test('Should return an event', () async {
    serviceLocator.registerLazySingleton<EventsApi>(() => MockEventsApi());
    final eventsApi = serviceLocator<EventsApi>();

    final events = await eventsApi.fetchEvents();
    final event = events[0];

    expect(event, isInstanceOf<Event>());
    expect(event.name, matches("Let's Build a Mobile App Using React Native! Pt. 1"));
    expect(event.attendeesCount, equals(73));
  });
}