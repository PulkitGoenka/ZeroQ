import 'package:flutter/material.dart';

class StoreSelectScreen extends StatelessWidget {
  const StoreSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Store"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // ✅ Scan Store QR
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/store-qr');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Scan Store QR"),
            ),

            const SizedBox(height: 20),

            // ✅ Select Store Manually
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/store_manual');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Select Store Manually"),
            ),
          ],
        ),
      ),
    );
  }
}
