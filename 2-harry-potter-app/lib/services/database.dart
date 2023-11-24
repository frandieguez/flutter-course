import 'package:harrypotter/models/character.dart';
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
    final isar = await Isar.open([CharacterSchema], directory: dir.path);

    return isar;
  }

  Future<List<Character>> getAllCharacters() async {
    isar ??= await init(); // Initialize the property isar if not started

    return await isar!.characters.where().findAll();
  }

  updateOrInsertCharacter(Character character) async {
    isar ??= await init(); // Initialize the property isar if not started

    return isar!.writeTxn(() async {
      isar!.characters.put(character);
    });
  }
}
