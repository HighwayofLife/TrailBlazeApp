import 'package:trailblaze/models/event.dart';

class ApiService {
  // Base URL would be replaced with actual API endpoint
  final String baseUrl = 'https://api.trailblazeapp.com';
  
  // Get all events
  Future<List<Event>> getEvents() async {
    try {
      // For initial development, return mock data
      // Later, this will be replaced with an actual API call
      
      // Uncomment below code when API is ready
      /*
      final response = await http.get(Uri.parse('$baseUrl/events'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Event.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
      */
      
      // Mock data for development
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      
      return [
        const Event(
          id: '1',
          name: 'Grizzly Mountain Ride',
          date: 'June 15-16, 2024',
          location: 'Prineville, OR',
          distances: ['25 miles', '50 miles', '100 miles'],
          organization: 'PNER',
          description: 'Annual Grizzly Mountain ride through beautiful Central Oregon.',
          latitude: 44.3429,
          longitude: -120.6581,
        ),
        const Event(
          id: '2',
          name: 'Mt. Adams Endurance Ride',
          date: 'July 6, 2024',
          location: 'Trout Lake, WA',
          distances: ['30 miles', '50 miles', '75 miles'],
          organization: 'PNER',
          description: 'Scenic ride with views of Mt. Adams in Washington.',
          latitude: 46.1548,
          longitude: -121.5456,
        ),
        const Event(
          id: '3',
          name: 'Bandit Springs',
          date: 'July 20-21, 2024',
          location: 'Prineville, OR',
          distances: ['25 miles', '50 miles'],
          organization: 'PNER',
          description: 'Popular summer ride in the Ochoco National Forest.',
          latitude: 44.2940,
          longitude: -120.5556,
        ),
      ];
      
    } catch (e) {
      throw Exception('Failed to load events: $e');
    }
  }
  
  // Get specific event by ID
  Future<Event> getEventById(String id) async {
    try {
      // Mock data for development
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
      
      return Event(
        id: id,
        name: 'Grizzly Mountain Ride',
        date: 'June 15-16, 2024',
        location: 'Prineville, OR',
        distances: ['25 miles', '50 miles', '100 miles'],
        organization: 'PNER',
        description: 'Annual Grizzly Mountain ride through beautiful Central Oregon. This multi-day event features stunning views and challenging trails through the high desert terrain.',
        flyerUrl: 'https://example.com/flyers/grizzly_mountain_2024.pdf',
        latitude: 44.3429,
        longitude: -120.6581,
      );
      
      // Uncomment below code when API is ready
      /*
      final response = await http.get(Uri.parse('$baseUrl/events/$id'));
      
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return Event.fromJson(data);
      } else {
        throw Exception('Failed to load event details: ${response.statusCode}');
      }
      */
    } catch (e) {
      throw Exception('Failed to load event details: $e');
    }
  }
  
  // Ask a question to the AI assistant
  Future<String> askQuestion(String question, {String? eventId}) async {
    try {
      // Mock response for development
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      
      return 'This is a placeholder response from the AI assistant. The actual implementation will send the question to the backend API, which will use Gemini API to generate a response based on the question and relevant event data.';
      
      // Uncomment below code when API is ready
      /*
      final response = await http.post(
        Uri.parse('$baseUrl/qa'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'question': question,
          'eventId': eventId,
        }),
      );
      
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        return data['answer'];
      } else {
        throw Exception('Failed to get answer: ${response.statusCode}');
      }
      */
    } catch (e) {
      throw Exception('Failed to get answer: $e');
    }
  }
}
