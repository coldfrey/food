import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String imagePath;

  LoadingScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Simulate a delay for loading (this will be replaced by the AI processing later)
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.push(
      //   context,
      // MaterialPageRoute(
      // builder: (context) => IngredientScreen(),
      // ),
      // );
    });

    return const Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
