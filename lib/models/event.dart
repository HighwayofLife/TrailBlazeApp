class Event {
  final String id;
  final String name;
  final String date;
  final String location;
  final List<String> distances;
  final String organization;
  final String? description;
  final String? flyerUrl;
  final double? latitude;
  final double? longitude;

  const Event({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.distances,
    required this.organization,
    this.description,
    this.flyerUrl,
    this.latitude,
    this.longitude,
  });

  // Convert from JSON - will be used when retrieving data from API
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
      location: json['location'] as String,
      distances: List<String>.from(json['distances'] as List),
      organization: json['organization'] as String,
      description: json['description'] as String?,
      flyerUrl: json['flyerUrl'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }

  // Convert to JSON - will be used when storing data locally
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'location': location,
      'distances': distances,
      'organization': organization,
      'description': description,
      'flyerUrl': flyerUrl,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
