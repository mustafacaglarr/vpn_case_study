// lib/presentation/home/viewmodel/home_viewmodel.dart

import 'dart:async';
import 'package:get/get.dart';
import 'package:vpn_case_study/core/models/connection_stats.dart';
import 'package:vpn_case_study/core/models/country.dart';
import 'package:vpn_case_study/data/mock/mock_countries.dart';
import 'package:vpn_case_study/data/mock/mock_connection_stats.dart'; // Listeyi import et

class HomeViewModel extends GetxController {
  var countries = <Country>[].obs;
  var connectionStats = Rxn<ConnectionStats>();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    countries.value = mockCountries;
  }

  void connectToCountry(Country country) {
    // Eski timer'ı iptal eder
    _timer?.cancel();

    // Tüm ülkeleri disconnect yapar
    for (var c in countries) {
      c.isConnected = false;
    }
    country.isConnected = true;

    // Seçilen ülkeye ait stats'ı listeden bulmak için
    final initial = mockConnectionStatsList.firstWhere(
      (s) => s.connectedCountry?.name == country.name,
      orElse: () => ConnectionStats(
        downloadSpeed: 0,
        uploadSpeed: 0,
        connectedTime: Duration.zero,
        connectedCountry: country,
      ),
    );

    // Bağlantı istatistiklerini başlat
    connectionStats.value = ConnectionStats(
      downloadSpeed: initial.downloadSpeed,
      uploadSpeed: initial.uploadSpeed,
      connectedTime: Duration.zero, // her zaman sıfırdan başlatmak için
      connectedCountry: country,
    );

    // Her saniye süreyi artırır
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final stats = connectionStats.value;
      if (stats != null) {
        connectionStats.value = ConnectionStats(
          downloadSpeed: stats.downloadSpeed,
          uploadSpeed: stats.uploadSpeed,
          connectedTime: stats.connectedTime + const Duration(seconds: 1),
          connectedCountry: stats.connectedCountry,
        );
      }
    });

    update();
  }

  void disconnect() {
    _timer?.cancel();
    for (var c in countries) {
      c.isConnected = false;
    }
    connectionStats.value = null;
    update();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
