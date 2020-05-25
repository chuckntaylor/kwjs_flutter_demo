import 'package:date_format/date_format.dart';
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

  // Styles
  final TextStyle dateStyle = TextStyle(
    color: Colors.black,
    fontSize: 20
  );

  final TextStyle titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 16
  );

  final TextStyle attendeesStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14
  );


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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                            child: Text(_formatDate(model.events[index].startsAt),
                            style: dateStyle,)
                        ),
                        VerticalDivider(
                          width: 30,
                          thickness: 1,
                          color: Colors.grey
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${model.events[index].name}', style: titleStyle,),
                              SizedBox(height: 8,),
                              Text('${model.events[index].attendeesCount} attendees', style: attendeesStyle,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  String _formatDate(String date) {
    final _parsedDate = DateTime.parse(date);
    return formatDate(_parsedDate, ['M', ' ', 'd']);
  }
}