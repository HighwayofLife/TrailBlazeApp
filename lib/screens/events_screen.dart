import 'package:flutter/material.dart';
import 'package:trailblaze/models/event.dart';
import 'package:trailblaze/widgets/event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  // This would eventually come from the API
  List<Event> get _mockEvents => [
    Event(
      id: '1',
      name: 'Grizzly Mountain Ride',
      date: 'June 15-16, 2024',
      location: 'Prineville, OR',
      distances: ['25 miles', '50 miles', '100 miles'],
      organization: 'PNER',
    ),
    Event(
      id: '2',
      name: 'Mt. Adams Endurance Ride',
      date: 'July 6, 2024',
      location: 'Trout Lake, WA',
      distances: ['30 miles', '50 miles', '75 miles'],
      organization: 'PNER',
    ),
    Event(
      id: '3',
      name: 'Bandit Springs',
      date: 'July 20-21, 2024',
      location: 'Prineville, OR',
      distances: ['25 miles', '50 miles'],
      organization: 'PNER',
      description: 'Popular summer ride in the Ochoco National Forest.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _mockEvents.length,
        itemBuilder: (context, index) {
          return EventCard(event: _mockEvents[index]);
        },
      ),
    );
  }
}
