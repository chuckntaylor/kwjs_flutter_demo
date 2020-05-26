import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:kwjsflutter/business_logic/models/event.dart';

class EventScreen extends StatefulWidget {

  final Event event;

  EventScreen(this.event) {
    if (event == null) {
      throw ArgumentError("event of EventScreen cannot be null. Received: '$event'");
    }
  }

  @override
  State createState() {
    return _EventScreenState(event);
  }
}

class _EventScreenState extends State<EventScreen> {

  final Event event;
  _EventScreenState(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${event.name}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 8,),
            Text(_formatDate(event.startsAt),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey
              ),),
            Text('${event.attendeesCount} attendees',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey)),
            SizedBox(height: 20,),
            Expanded(child: SingleChildScrollView(child: Text(event.description)))
          ],
        )
      ),
    );
  }

  String _formatDate(String date) {
    final _parsedDate = DateTime.parse(date);
    return formatDate(_parsedDate, ['M', ' ', 'd', ', ', 'yyyy']);
  }
}