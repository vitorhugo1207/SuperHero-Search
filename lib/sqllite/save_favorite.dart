import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:superhero_search/constants/app_constants.dart';
import '../models/hero.dart' as HeroModel;

void saveFavoriteHero(HeroModel.Hero hero) async {
  final database = await openDatabase(
    join(await getDatabasesPath(), AppConstants.database),
  );

  await database.insert(
    'heroes',
    hero.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}