import 'package:flutter/material.dart';

class ManualStoreSelectScreen extends StatefulWidget {
  const ManualStoreSelectScreen({super.key});

  @override
  State<ManualStoreSelectScreen> createState() =>
      _ManualStoreSelectScreenState();
}

class _ManualStoreSelectScreenState extends State<ManualStoreSelectScreen> {
  final TextEditingController pincodeController = TextEditingController();

  final List<String> stores = [
    "Reliance Sector 5",
    "Reliance City Mall",
    "Reliance Metro",
  ];

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
            /// PINCODE INPUT
            TextField(
              controller: pincodeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                labelText: "Enter Pincode",
                border: OutlineInputBorder(),
                counterText: "",
              ),
            ),

            const SizedBox(height: 24),

            /// STORE LIST
            Expanded(
              child: ListView.separated(
                itemCount: stores.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    title: Text(
                      stores[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${stores[index]} selected"),
                        ),
                      );

                      // ✅ Lock store and go to product scan
                      Navigator.pushReplacementNamed(context, '/scan');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
