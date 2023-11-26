// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// enum StorageKeys {
//   user('user');

//   const StorageKeys(this.key);

//   final String key;
// }


// late final Database $database;

// class DBService {
//   static Future<void> initialize() async {
//   final String firstName;
//   final String lastName;
//   final String phoneNumber;
//   final String? sex;
//   final String? email;
//   final double lon;
//   final double lat;
//   List<ProducModel>? korzinka = [];

//     $database = await openDatabase(
//       join(await getDatabasesPath(), 'database.db'),
//       onCreate: (db, version) => db.execute(
//         'CREATE TABLE ${StorageKeys.user.key}('
//         'firstName TEXT,'
//         'lastName TEXT,'
//         'phoneNumber TEXT,'
//         'sex TEXT,'
//         'email TEXT,'
//         'lon REAL,'
//         'lat REAL,'
//         ')',
//       ),
//       version: 1,
//     );
//   }

//   Future<void> insert(Map<String, Object?> movie) => $database.insert(StorageKeys.user.key, movie);


//   Future<List<MovieModel>> getMovies() async => (await $database.query(
//         StorageKeys.movies.key,
//       ))
//           .map(MovieModel.fromMap)
//           .toList();

//   Future<void> delete(int id) => $database.delete(
//         StorageKeys.movies.key,
//         where: 'id = ?',
//         whereArgs: [id],
//       );

//   Future<MovieModel?> getMovie(int id) async => (await $database.query(
//         StorageKeys.movies.key,
//         where: 'id = ? ',
//         whereArgs: [id],
//       ))
//           .map(MovieModel.fromMap)
//           .firstOrNull;
// }