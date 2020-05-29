import 'package:date_format/date_format.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:kwjsflutter/services/events/events_api_mock.dart';
import 'package:kwjsflutter/services/events/events_api.dart';
import 'package:kwjsflutter/services/service_locator.dart';
import 'package:kwjsflutter/ui/views/events_screen.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';

void main() async {

//  TestWidgetsFlutterBinding.ensureInitialized();

  String _formatDate(String date) {
    final _parsedDate = DateTime.parse(date);
    return formatDate(_parsedDate, ['M', ' ', 'd']);
  }

  setUpAll(() {
    setupServiceLocator();
    serviceLocator.allowReassignment = true;
    serviceLocator.registerLazySingleton<EventsApi>(() => MockEventsApi());
  });

  testWidgets('Should render the event on screen', (WidgetTester tester) async {
    // setup the MockEventsApi

    final eventsApi = serviceLocator<EventsApi>();
    // get an event to pass to the screen
    final List<Event> events = await eventsApi.fetchEvents();

    await tester.pumpWidget(MaterialApp(home: EventsScreen(),));
    await tester.pump();

    // check that the correct number of events are coming in
    expect(events, hasLength(2));

    final formattedDate = _formatDate(events[0].startsAt);
    expect(formattedDate, matches('Apr 22'));

    final dateFinder = find.text(_formatDate(events[0].startsAt));
    expect(dateFinder, findsOneWidget);

    final eventListItemsFinder = find.byType(Card);
    expect(eventListItemsFinder, findsNWidgets(2));
  });
}