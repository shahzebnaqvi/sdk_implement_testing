import 'package:sdk_implement_testing/data/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initDatabase() async {
     _database = await openDatabase(
    join(await getDatabasesPath(), 'tasks.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isDone INTEGER)',
      );
    },
    version: 1,
  );
  }

  Future<int> insertTask(Task task) async {
    await initDatabase();
    return await _database.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    await initDatabase();
    final List<Map<String, dynamic>> maps = await _database.query('tasks');
    return List.generate(
      maps.length,
      (i) {
        return Task(
          id: maps[i]['id'],
          name: maps[i]['name'],
          isDone: maps[i]['isDone'] == 1,
        );
      },
    );
  }

  Future<void> updateTask(Task task) async {
    await initDatabase();
    await _database.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    await initDatabase();
    await _database.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
