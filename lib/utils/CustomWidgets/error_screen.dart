import 'package:flutter/material.dart';

import '../../src/view/dashboard.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;

  const ErrorScreen({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error.png', // Add an error illustration
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 32),
            Text(
              'Oops! Something went wrong',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen(),)),
              child: const Text('Return to Home'),
            ),
          ],
        ),
      ),
    );
  }
}