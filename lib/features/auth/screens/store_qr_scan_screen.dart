import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class StoreQrScanScreen extends StatefulWidget {
  const StoreQrScanScreen({super.key});

  @override
  State<StoreQrScanScreen> createState() => _StoreQrScanScreenState();
}

class _StoreQrScanScreenState extends State<StoreQrScanScreen> {
  bool scanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Scan Store QR"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              if (scanned) return;
              scanned = true;
              Navigator.pushReplacementNamed(context, '/store-dashboard');
            },
          ),
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
