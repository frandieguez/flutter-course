import 'package:fitness_time/models/activity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  static final Database _singleton = Database._internal();

  // Constructor interno, para evitar que nos llamen desde fuera
  Database._internal();

  Isar? isar;

  // Constructor publico que llama al singleton
  factory Database() => _singleton;

  static Database get instance => _singleton;

  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([ActivitySchema], directory: dir.path);

    return isar;
  }

  Future<List<Activity>> getAllActivites() async {
    isar ??= await init(); // Initialize the property isar if not started

    return await isar!.activitys.where().findAll();
  }

  updateOrInsertActivity(Activity character) async {
    isar ??= await init(); // Initialize the property isar if not started

    return isar!.writeTxn(() async {
      isar!.activitys.put(character);
    });
  }

  removeActivity(int id ) async {
    isar ??= await init();

    return await isar!.activitys.delete(id);
  }
}
