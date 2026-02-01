import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class ScanProductScreen extends StatefulWidget {
  const ScanProductScreen({super.key});

  @override
  State<ScanProductScreen> createState() => _ScanProductScreenState();
}

class _ScanProductScreenState extends State<ScanProductScreen>
    with SingleTickerProviderStateMixin {
  final MobileScannerController scannerController =
      MobileScannerController();

  final Map<String, int> cart = {};
  String? lastScannedCode;
  bool isPaused = false;
  bool torchOn = false;

  late AnimationController lineController;
  late Animation<double> lineAnimation;

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    lineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    lineAnimation =
        Tween<double>(begin: 0, end: 260).animate(lineController);
  }

  @override
  void dispose() {
    scannerController.dispose();
    lineController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    if (isPaused) return;
    if (capture.barcodes.isEmpty) return;

    final code = capture.barcodes.first.rawValue;
    if (code == null) return;

    // Pause scanner
    await scannerController.stop();
    setState(() => isPaused = true);

    cart.update(code, (v) => v + 1, ifAbsent: () => 1);
    lastScannedCode = code;

    HapticFeedback.mediumImpact();
    await audioPlayer.play(AssetSource('sounds/beep.mp3'));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          cart[code] == 1
              ? "Product added ✔"
              : "Quantity updated (${cart[code]}x)",
        ),
        duration: const Duration(seconds: 1),
      ),
    );

    // Auto resume after 1 sec
    Future.delayed(const Duration(seconds: 1), resumeScan);
  }

  void resumeScan() async {
    await scannerController.start();
    if (!mounted) return;
    setState(() => isPaused = false);
  }

  void toggleTorch() async {
    await scannerController.toggleTorch();
    setState(() => torchOn = !torchOn);
  }

  int get totalItems =>
      cart.values.fold(0, (sum, qty) => sum + qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Scan Products"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              torchOn ? Icons.flash_on : Icons.flash_off,
            ),
            onPressed: toggleTorch,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),

      body: Stack(
        children: [
          /// CAMERA
          MobileScanner(
            controller: scannerController,
            onDetect: onDetect,
          ),

          /// SCAN FRAME + LINE
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.greenAccent, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: AnimatedBuilder(
                animation: lineAnimation,
                builder: (_, __) => Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin:
                        EdgeInsets.only(top: lineAnimation.value),
                    height: 2,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
            ),
          ),

          /// BOTTOM BUTTONS
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              children: [
                if (isPaused)
                  ElevatedButton(
                    onPressed: resumeScan,
                    child: const Text("Scan Next Product"),
                  ),

                const SizedBox(height: 8),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/cart'),
                  child: Text("Go to Cart ($totalItems)"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
