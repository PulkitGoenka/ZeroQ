import 'package:flutter/material.dart';

class ScanHistoryScreen extends StatelessWidget {
  final Map<String, int> scannedItems;

  const ScanHistoryScreen({
    super.key,
    this.scannedItems = const {},
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan History"),
      ),
      body: scannedItems.isEmpty
          ? _emptyState()
          : ListView(
              padding: const EdgeInsets.all(16),
              children: scannedItems.entries.map((entry) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.qr_code),
                    title: Text(entry.key),
                    trailing: Text("x${entry.value}"),
                  ),
                );
              }).toList(),
            ),
    );
  }

  Widget _emptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "No products scanned yet",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
