import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kwjsflutter/services/service_locator.dart';
import 'package:kwjsflutter/services/events/events_api.dart';
import 'package:kwjsflutter/services/events/events_api_mock.dart';
import 'package:kwjsflutter/ui/views/event_screen.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    setupServiceLocator();
    serviceLocator.allowReassignment = true;
  });

  testWidgets('Should render the event on screen', (WidgetTester tester) async {
    // setup the MockEventsApi
    serviceLocator.registerLazySingleton<EventsApi>(() => MockEventsApi());
    final eventsApi = serviceLocator<EventsApi>();
    // get an event to pass to the screen
    final events = await eventsApi.fetchEvents();
    final event = events[0];

    // test that the title renders
    await tester.pumpWidget(MaterialApp(home: EventScreen(event),));

    // create finders
    final titleFinder = find.text("Let's Build a Mobile App Using React Native! Pt. 1");
    final dateFinder = find.text("April 22, 2020");
    final attendeesFinder = find.text('${event.attendeesCount} attendees');

    // run expects
    expect(titleFinder, findsNWidgets(2));
    expect(dateFinder, findsOneWidget);
    expect(attendeesFinder, findsOneWidget);
  });


}