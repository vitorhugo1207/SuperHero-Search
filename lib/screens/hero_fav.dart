import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:superhero_search/constants/app_constants.dart';
import 'package:superhero_search/models/hero.dart' as HeroModel;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HeroFav extends StatefulWidget {
  const HeroFav({super.key});

  @override
  State<HeroFav> createState() => _HeroFavState();
}

class _HeroFavState extends State<HeroFav> {
  List<HeroModel.Hero> _favoriteHeroes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoriteHeroes();
  }

  Future<void> _loadFavoriteHeroes() async {
    try {
      final database = await openDatabase(
        join(await getDatabasesPath(), AppConstants.database),
      );

      final List<Map<String, dynamic>> maps = await database.query('heroes');

      setState(() {
        _favoriteHeroes = List.generate(maps.length, (i) {
          return HeroModel.Hero.fromMap(maps[i]);
        });
        _isLoading = false;
      });
    } catch (e) {
      log("Error opening database: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.paddingInitial,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _favoriteHeroes.length,
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: Image.network(
                        _favoriteHeroes[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
