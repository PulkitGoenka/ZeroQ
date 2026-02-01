import 'package:flutter/material.dart';

import 'package:easyscan/features/auth/screens/login_screen.dart';
import 'package:easyscan/features/auth/screens/otp_screen.dart';
import 'package:easyscan/features/auth/screens/brand_selection.dart';
import 'package:easyscan/features/auth/screens/store_select_screen.dart';
import 'package:easyscan/features/auth/screens/store_qr_scan_screen.dart';
import 'package:easyscan/features/auth/screens/manual_store_select_screen.dart';
import 'package:easyscan/features/auth/screens/store_dashboard_screen.dart'; // ✅ ADD THIS
import 'package:easyscan/features/auth/screens/scan_product_screen.dart';
import 'package:easyscan/features/auth/screens/scan_history_screen.dart';
import 'package:easyscan/features/auth/screens/cart_screen.dart';
import 'package:easyscan/features/auth/screens/order_qr_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    /// 🔐 Auth
    '/': (context) => const LoginScreen(),
    '/otp': (context) => const OtpScreen(),

    /// 🏬 Store selection
    '/brand': (context) => const BrandSelectionScreen(),
    '/store': (context) => const StoreSelectScreen(),
    '/store-qr': (context) => const StoreQrScanScreen(),
    '/store-manual': (context) => const ManualStoreSelectScreen(),

    /// 🧭 NEW STORE HUB (IMPORTANT)
    '/store-dashboard': (context) => const StoreDashboardScreen(),

    /// 🛒 Shopping flow
    '/scan': (context) => const ScanProductScreen(),
    '/scan-history': (context) => const ScanHistoryScreen(),
    '/cart': (context) => const CartScreen(),
    '/qr': (context) => const OrderQrScreen(),
  };
}
