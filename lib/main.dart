import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:le_spawn/utils/constants.dart';
import 'package:le_spawn/ui/screens/tab_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: LeSpawn(),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
    ),
  );
}

class LeSpawn extends StatelessWidget {
  const LeSpawn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Spawn',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const TabScreen(),
    );
  }
}
