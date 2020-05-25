import 'package:get_it/get_it.dart';
import 'package:kwjsflutter/business_logic/view_models/events_screen_viewmodel.dart';
import 'package:kwjsflutter/services/events/events_api_mock.dart';
import 'package:kwjsflutter/services/events/events_api_impl.dart';
import 'package:kwjsflutter/services/events/events_api.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<EventsApi>(() => EventsApiImpl());

  serviceLocator.registerFactory<EventsScreenViewModel>(() => EventsScreenViewModel());
}