import 'package:cba/LoadingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CBAApp());
}

class CBAApp extends StatelessWidget {
  const CBAApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CBA - Cook By AI'),
      ),
      body: const Center(
        child: Text('Take a photo of your ingredients!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final XFile? image =
              await _picker.pickImage(source: ImageSource.camera);
          if (image != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoadingScreen(imagePath: image.path),
              ),
            );
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
