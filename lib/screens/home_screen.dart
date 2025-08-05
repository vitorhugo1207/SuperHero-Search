import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:superhero_search/constants/app_constants.dart';
import '../models/hero.dart' as HeroModel;
import '../services/hero_service.dart';
import '../widgets/hero_list_tile_img.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HeroService _heroService = HeroService();
  List<HeroModel.Hero> _heroes = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState(); // precisa disso por algum motivo
    _search('');
  }

  void _search(String query) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final fetchedHeroes = await _heroService.searchHero(query);
      setState(() {
        _heroes = fetchedHeroes;
      });
    } catch (e) {
      log(e.toString());
      setState(() {
        _heroes = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SuperHero Search')),
      body: Padding(
        padding: AppConstants.paddingInitial,
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: _search,
              decoration: const InputDecoration(
                hintText: 'Search for your hero',
                border: OutlineInputBorder(),
              ),
            ),
            AppConstants.spaceMedium,
            _isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                child: _heroes.isEmpty
                  ? const Center(child: Text('No heroes found.'))
                  : ListView.builder(
                      itemCount: _heroes.length,
                      itemBuilder: (context, index) {
                        return HeroListTile(hero: _heroes[index]);
                      },
                    ),
              ),
          ],
        ),
      ),
    );
  }
}