class Event {
  
  final String id;
  final String name;
  final String description;
  final String startsAt;
  final String endsAt;
  final int duration;
  final int attendeesCount;
  
  Event({
    this.id,
    this.name,
    this.description,
    this.startsAt,
    this.endsAt,
    this.duration,
    this.attendeesCount
  });
  
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startsAt: json['starts_at'],
      endsAt: json['ends_at'],
      duration: json['duration'],
      attendeesCount: json['attendees_count'],
    );
  }
}