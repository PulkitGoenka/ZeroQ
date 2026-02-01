import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map<String, int> cart = {
    "8901234567890": 2,
    "8909876543210": 1,
  };

  int get totalItems =>
      cart.values.fold(0, (sum, qty) => sum + qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: cart.isEmpty
          ? _emptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: cart.entries.map((entry) {
                      return Card(
                        child: ListTile(
                          title: Text(entry.key),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (entry.value == 1) {
                                      cart.remove(entry.key);
                                    } else {
                                      cart[entry.key] = entry.value - 1;
                                    }
                                  });
                                },
                              ),
                              Text("${entry.value}"),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    cart[entry.key] = entry.value + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/qr');
                    },
                    child: Text("Checkout ($totalItems items)"),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _emptyCart() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined,
              size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text("Your cart is empty",
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
