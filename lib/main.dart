import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:get/get.dart';
import 'package:vpn_case_study/presentation/home/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Yalnızca alt navigation bar görünsün, üst status bar gizlensin:
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VPN UI',
      theme: ThemeData(
        // İstersen burayı constants.dart üzerinden renklendirebilirsin
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF101015), // veya kBackgroundColor
        fontFamily: 'SFPro',
      ),
      home:  HomeView(),
    );
  }
}
