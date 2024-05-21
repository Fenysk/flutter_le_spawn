import 'package:flutter/material.dart';
import 'package:le_spawn/ui/screens/home_screen.dart';
import 'package:le_spawn/utils/constants.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPage = 0;

  void _onTapAddGame() => print('Ajouter un jeu');

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const HomeScreen();

    switch (_selectedPage) {
      case 0:
        mainContent = const HomeScreen();
        print('HomeScreen');
        break;
      case 1:
        mainContent = const Center(
          child: Text('Découvrir'),
        );
        print('Découvrir');
        break;
      case 2:
        mainContent = const Center(
          child: Text('Ma collection'),
        );
        print('Ma collection');
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Image.asset(
          'assets/images/Logo_WB.png',
          width: 120,
        ),
      ),
      body: mainContent,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onTapAddGame,
        tooltip: 'Ajouter un jeu à votre collection',
        icon: const Icon(Icons.add),
        label: const Text('Ajouter un jeu'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => _selectedPage = index),
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Ma collection',
            tooltip: 'Accéder à votre collection de jeux-vidéo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Découvrir',
            tooltip: 'Découvrir la collection d\'autres joueurs',
          ),
        ],
      ),
    );
  }
}
