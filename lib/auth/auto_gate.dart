import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AutoGate extends StatelessWidget {
  const AutoGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Loading state while checking authentication
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Giriş yapılıyor...'),
                ],
              ),
            ),
          );
        }

        // Error state
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  const Text('Bir hata oluştu'),
                  const SizedBox(height: 8),
                  Text('${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Retry authentication
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const AutoGate(),
                        ),
                      );
                    },
                    child: const Text('Tekrar Dene'),
                  ),
                ],
              ),
            ),
          );
        }

        // Check authentication state
        if (snapshot.hasData) {
          final authChange = snapshot.data;
          final session = authChange?.session;
          final user = session?.user;

          if (user != null) {
            // User is authenticated, show HomePage
            return const HomePage();
          }
        }

        // User is not authenticated, show LoginPage
        return const LoginPage();
      },
    );
  }
}
