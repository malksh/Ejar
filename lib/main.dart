import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/UIs/SginInPage/sginInPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "aa-store",
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAsE4ErPliKAUQHOUarhBIJ202TLQyPhZA',
        appId: '1:225521775651:android:e8665c5b431e49f326ad96',
        messagingSenderId: '225521775651',
        projectId: 'movie-d7f72'),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: SginInPage(),
    );
  }
}
