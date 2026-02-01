import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text("Enter the 6-digit OTP"),
            const SizedBox(height: 24),

            TextField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(counterText: ""),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/store'),
              child: const Text("Verify"),
            ),

            TextButton(
              onPressed: () {},
              child: const Text("Resend OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
