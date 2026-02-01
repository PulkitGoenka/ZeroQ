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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),

            /// 🟢 Scan Store QR
            _StoreOptionCard(
              icon: Icons.qr_code_scanner,
              title: "Scan Store QR",
              subtitle: "Scan QR at store entrance",
              onTap: () {
                Navigator.pushNamed(context, '/store-qr');
              },
            ),

            const SizedBox(height: 20),

            /// 🟢 Manual Store Selection
            _StoreOptionCard(
              icon: Icons.store,
              title: "Select Store Manually",
              subtitle: "Search store using pincode",
              onTap: () {
                Navigator.pushNamed(context, '/store-manual');
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔁 Reusable Store Option Card
class _StoreOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _StoreOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            /// Icon Circle
            CircleAvatar(
              radius: 28,
              backgroundColor: primary.withValues(alpha: 0.1), // ✅ FIXED
              child: Icon(
                icon,
                size: 28,
                color: primary,
              ),
            ),

            const SizedBox(width: 16),

            /// Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
