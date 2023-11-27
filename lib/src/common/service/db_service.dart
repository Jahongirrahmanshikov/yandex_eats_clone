import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/product_model.dart';
import '../model/user_model.dart';

enum StorageKeys {
  user('user');

  const StorageKeys(this.key);

  final String key;
}

late final Database _database;

class DBService {
  static Future<void> initialize() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) => _createTables(db),
      version: 1,
    );
  }

  static void _createTables(Database db) async{
    await db.execute(
      'CREATE TABLE ${StorageKeys.user.key}('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'firstName TEXT, '
      'lastName TEXT, '
      'phoneNumber TEXT, '
      'sex TEXT, '
      'email TEXT, '
      'lon REAL, '
      'lat REAL, '
      'korzinka TEXT, '
      'history TEXT'
      ')',
    );
  }

  static Future<void> addUser(UserModel user) async {
    await _database.insert(
      StorageKeys.user.key,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> updateUser(UserModel user) async {
    await _database.update(
      StorageKeys.user.key,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<List<UserModel>> getAllUsers() async {
    final List<Map<String, dynamic>> maps =
        await _database.query(StorageKeys.user.key);
    return List.generate(maps.length, (i) {
      return UserModel(
        id: maps[i]['id'],
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        phoneNumber: maps[i]['phoneNumber'],
        sex: maps[i]['sex'],
        email: maps[i]['email'],
        lon: maps[i]['lon'],
        lat: maps[i]['lat'],
        korzinka: _decodeJsonList(maps[i]['korzinka']),
        history: _decodeJsonList(maps[i]['history']),
      );
    });
  }

  static List<RestaurantProducts>? _decodeJsonList(String? jsonList) {
    if (jsonList == null) {
      return null;
    }
    List<dynamic> decodedList = jsonDecode(jsonList);
    return decodedList.map((item) => RestaurantProducts.fromMap(item)).toList();
  }

  static Future<void> closeDatabase() async {
    await _database.close();
  }
}

void main() async {
  await DBService.initialize();

  // Adding a user to the database
  await DBService.addUser(
    UserModel(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      phoneNumber: '1234567890',
      sex: 'Male',
      email: 'john.doe@example.com',
      lon: 0.0,
      lat: 0.0,
      korzinka: [
        RestaurantProducts(
          id: 1,
          category: 'Category 1',
          image: 'Image 1',
          description: 'Description 1',
          price: 10.0,
          gram: '100g',
          count: 2,
        ),
        // Add more products as needed
      ],
      history: [
        RestaurantProducts(
          id: 2,
          category: 'Category 2',
          image: 'Image 2',
          description: 'Description 2',
          price: 15.0,
          gram: '150g',
          count: 1,
        ),
        // Add more products as needed
      ],
    ),
  );

  // Updating the user in the database
  await DBService.updateUser(
    UserModel(
      id: 1,
      firstName: 'Updated John',
      lastName: 'Updated Doe',
      phoneNumber: '9876543210',
      sex: 'Male',
      email: 'updated.john.doe@example.com',
      lon: 1.0,
      lat: 1.0,
      korzinka: [
        RestaurantProducts(
          id: 3,
          category: 'Category 3',
          image: 'Image 3',
          description: 'Description 3',
          price: 20.0,
          gram: '200g',
          count: 3,
        ),
        // Add more products as needed
      ],
      history: [
        RestaurantProducts(
          id: 4,
          category: 'Category 4',
          image: 'Image 4',
          description: 'Description 4',
          price: 25.0,
          gram: '250g',
          count: 4,
        ),
        // Add more products as needed
      ],
    ),
  );

  // Querying all users from the database
  List<UserModel> users = await DBService.getAllUsers();
  print(users);

  // Remember to close the database when it's no longer needed
  await DBService.closeDatabase();
}
