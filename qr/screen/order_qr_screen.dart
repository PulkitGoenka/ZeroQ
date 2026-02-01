import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(
        children: [
          const ListTile(
            title: Text("Product A"),
            trailing: Text("₹120"),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/qr');
            },
            child: const Text("PROCEED"),
          )
        ],
      ),
    );
  }
}
