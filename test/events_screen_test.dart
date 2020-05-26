import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:kwjsflutter/business_logic/view_models/events_screen_viewmodel.dart';
import 'package:kwjsflutter/business_logic/view_models/events_screen_viewmodel_mock.dart';
import 'package:kwjsflutter/services/events/events_api_mock.dart';
import 'package:kwjsflutter/services/events/events_api.dart';
import 'package:kwjsflutter/services/service_locator.dart';
import 'package:kwjsflutter/ui/views/events_screen.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';


void main() {

  setUpAll(() {
    setupServiceLocator();
    serviceLocator.allowReassignment = true;
  });

  testWidgets('Should render the event on screen', (WidgetTester tester) async {
    // setup the MockEventsApi
    serviceLocator.registerLazySingleton<EventsApi>(() => MockEventsApi());
    serviceLocator.registerFactory<EventsScreenViewModel>(() => MockEventsScreenViewModel());

    final eventsApi = serviceLocator<EventsApi>();
    // get an event to pass to the screen
    final events = await eventsApi.fetchEvents();

    // test that the screen renders
    await tester.pumpWidget(MaterialApp(home: EventsScreen(),));

    // check that the correct number of events are coming in
    expect(events, hasLength(3));

    final titleFinder1 = find.text('Events');
    expect(titleFinder1, findsOneWidget);
  });
}