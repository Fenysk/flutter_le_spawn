import 'package:flutter/material.dart';
import 'package:le_spawn/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Collection de Fenysk',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Grobold',
            ),
          ),
          Container(
            height: 200,
            color: AppColors.accent,
          ),
        ],
      ),
    );
  }
}
