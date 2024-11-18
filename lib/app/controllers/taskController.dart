import 'package:get/get.dart';
import 'package:latihanpas/app/models/taskModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskController extends GetxController {
  // CRUD table database
  static Database? _db;

  // list data yang digunakan untuk menampun hasil database, .obs diguanakan di UI
  var tasks = <TaskModel>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
      await loadTasks();
    }
    return _db;
  }

  Future<Database> initDB() async {
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, 'task_database.db');

  return await openDatabase(
    path,
    version: 2, // Ubah versi ke angka yang lebih tinggi
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          title TEXT, 
          description TEXT, 
          imageUrl TEXT
        )
      ''');
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < newVersion) {
        // Tambahkan kolom 'imageUrl' jika belum ada
        await db.execute("ALTER TABLE tasks ADD COLUMN imageUrl TEXT");
      }
    },
  );
  }

  @override
  void onInit() {
    super.onInit();
    loadTasks(); // Panggil loadTasks saat controller diinisialisasi
  }

  // Insert Task
  Future<int> addTask(TaskModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('tasks', task.toMap());
    loadTasks();
    return result;
  }

  // Retrieve Tasks
  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('tasks');
    tasks.assignAll(queryResult.map((data) => TaskModel.fromMap(data)).toList());
  }

  // Delete Task
  Future<void> deleteTask(int id) async {
    var dbClient = await db;
    await dbClient!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }

  // Update Task
  /*
  Future<int> updateTask(TaskModel task) async {
    var dbClient = await db;
    int result = await dbClient!.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
    loadTasks();
    return result;
  }*/

}
