import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              const Icon(Icons.qr_code_scanner,
                  size: 80, color: Colors.green),

              const SizedBox(height: 16),
              const Text("Scan & Go",
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold)),

              const SizedBox(height: 32),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(labelText: "Full Name"),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          labelText: "Mobile Number",
                          prefixText: "+91 ",
                          counterText: "",
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (phoneController.text.length == 10) {
                    Navigator.pushNamed(context, '/otp');
                  }
                },
                child: const Text("Send OTP"),
              ),

              const Spacer(),
              const Text(
                "By continuing, you agree to our Terms & Privacy Policy",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
