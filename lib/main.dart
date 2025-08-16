import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/auto_gate.dart';

void main() async {
  //supabase setup
  await Supabase.initialize(
    url: 'https://snwlxryhvuqmzjyvpjqt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNud2x4cnlodnVxbXpqeXZwanF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUzNDQ5NDgsImV4cCI6MjA3MDkyMDk0OH0.Uv3VomxUHWTJETwQFsonbXMhcQ8oNca9G0YAEmXOIqE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Auth Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AutoGate(),
    );
  }
}
