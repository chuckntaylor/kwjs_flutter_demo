import 'package:flutter/material.dart';
import 'package:kwjsflutter/business_logic/view_models/events_screen_viewmodel.dart';
import 'package:kwjsflutter/services/service_locator.dart';
import 'package:provider/provider.dart';

class EventsScreen extends StatefulWidget {
  @override
  State createState() {
    return _EventsScreenState();
  }
}

class _EventsScreenState extends State<EventsScreen> {

  EventsScreenViewModel model = serviceLocator<EventsScreenViewModel>();


  @override
  void initState() {
    model.loadEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: buildListView(model),
    );
  }

  // build list view
  Widget buildListView(EventsScreenViewModel viewModel) {
    return ChangeNotifierProvider<EventsScreenViewModel>(
      create: (context) => viewModel,
      child: Consumer<EventsScreenViewModel>(
        builder: (context, model, child) => ListView.builder(
            itemCount: model.events.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text('${model.events[index].name}'),
                ),
              );
            }),
      ),
    );
  }
}