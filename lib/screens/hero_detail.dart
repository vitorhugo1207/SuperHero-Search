import 'package:flutter/material.dart';
import 'package:superhero_search/constants/app_constants.dart';
import 'package:superhero_search/sqllite/save_favorite.dart';
import '../models/hero.dart' as HeroModel;

class HeroDetailPage extends StatelessWidget {
  final HeroModel.Hero hero;

  const HeroDetailPage({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hero.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              saveFavoriteHero(hero);
            },
          ),
        ],
      ),
      body: Padding(
        padding: AppConstants.paddingInitial,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                hero.imageUrl,
                height: AppConstants.boxImgSizeBig.toDouble(),
                fit: BoxFit.cover,
              ),
            ),
            AppConstants.spaceMedium,
            Text(
              'Name: ${hero.name}',
              style: AppConstants.fontBold,
            ),
            AppConstants.spaceSmall,
            Text(
              'Full Name: ${hero.fullName}',
              style: AppConstants.fontNormal,
            ),
            AppConstants.spaceSmall,
          ],
        ),
      ),
    );
  }
}
