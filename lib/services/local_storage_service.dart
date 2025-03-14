import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trailblaze/models/event.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  static Database? _database;

  factory LocalStorageService() => _instance;

  LocalStorageService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'trailblaze.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE events(id TEXT PRIMARY KEY, name TEXT, date TEXT, location TEXT, distances TEXT, organization TEXT, description TEXT, flyerUrl TEXT, latitude REAL, longitude REAL)',
    );
  }

  // Save events to local database
  Future<void> saveEvents(List<Event> events) async {
    final Database db = await database;
    
    // Use a transaction for better performance with multiple inserts
    await db.transaction((txn) async {
      for (var event in events) {
        await txn.insert(
          'events',
          {
            'id': event.id,
            'name': event.name,
            'date': event.date,
            'location': event.location,
            'distances': event.distances.join(','),
            'organization': event.organization,
            'description': event.description ?? '',
            'flyerUrl': event.flyerUrl ?? '',
            'latitude': event.latitude ?? 0.0,
            'longitude': event.longitude ?? 0.0,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  // Get all events from local database
  Future<List<Event>> getEvents() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('events');

    return List.generate(maps.length, (i) {
      return Event(
        id: maps[i]['id'],
        name: maps[i]['name'],
        date: maps[i]['date'],
        location: maps[i]['location'],
        distances: maps[i]['distances'].split(','),
        organization: maps[i]['organization'],
        description: maps[i]['description'],
        flyerUrl: maps[i]['flyerUrl'],
        latitude: maps[i]['latitude'],
        longitude: maps[i]['longitude'],
      );
    });
  }

  // Get specific event by ID
  Future<Event?> getEventById(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Event(
        id: maps[0]['id'],
        name: maps[0]['name'],
        date: maps[0]['date'],
        location: maps[0]['location'],
        distances: maps[0]['distances'].split(','),
        organization: maps[0]['organization'],
        description: maps[0]['description'],
        flyerUrl: maps[0]['flyerUrl'],
        latitude: maps[0]['latitude'],
        longitude: maps[0]['longitude'],
      );
    }
    return null;
  }

  // Clear all events
  Future<void> clearEvents() async {
    final Database db = await database;
    await db.delete('events');
  }
}
