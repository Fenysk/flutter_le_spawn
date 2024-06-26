import 'package:flutter/material.dart';
import 'package:le_spawn/ui/screens/collection_screen.dart';
import 'package:le_spawn/ui/widgets/game/add_video_game_modal.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPage = 0;

  void _onTapAddGame() {
    showModalBottomSheet(
      context: context,
      builder: (modalContext) => const AddGameModal(),
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
    );
  }

  void _onTapProfile() {
    print('Profile page');
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const CollectionScreen();

    switch (_selectedPage) {
      case 0:
        mainContent = const CollectionScreen();
        print('Ma collection');
        break;
      case 1:
        mainContent = const Center(
          child: Text('Découvrir'),
        );
        print('Découvrir');
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Logo_WB.png',
          width: 120,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 32,
            onPressed: _onTapProfile,
          ),
        ],
      ),
      body: mainContent,
      floatingActionButton: _selectedPage != 0
          ? null
          : FloatingActionButton.extended(
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
            icon: Icon(Icons.gamepad_outlined),
            activeIcon: Icon(Icons.gamepad_rounded),
            label: 'Ma collection',
            tooltip: 'Accéder à votre collection de jeux-vidéo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore_rounded),
            label: 'Découvrir',
            tooltip: 'Découvrir la collection d\'autres joueurs',
          ),
        ],
      ),
    );
  }
}
