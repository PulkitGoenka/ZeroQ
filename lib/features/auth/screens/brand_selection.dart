import 'package:flutter/material.dart';

class BrandSelectionScreen extends StatelessWidget {
  const BrandSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = ['Reliance', 'D-Mart', 'Smart Bazaar'];

    return Scaffold(
      appBar: AppBar(title: const Text('Select Brand')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(brands[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/store');
              },
            ),
          );
        },
      ),
    );
  }
}
