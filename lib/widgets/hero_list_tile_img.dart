import 'package:flutter/material.dart';
import '../models/hero.dart' as HeroModel;
import '../screens/hero_detail.dart';
import '../constants/app_constants.dart';

class HeroListTile extends StatelessWidget {
  final HeroModel.Hero hero;
  const HeroListTile({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        hero.imageUrl,
        width: AppConstants.boxImgSize.toDouble(),
        height: AppConstants.boxImgSize.toDouble(),
        fit: BoxFit.cover,
      ),
      title: Text(
        hero.name,
        style: AppConstants.fontBold,
      ),
      subtitle: Text(
        hero.fullName,
        style: AppConstants.fontNormal,
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HeroDetailPage(hero: hero)));
      },
    );
  }
}