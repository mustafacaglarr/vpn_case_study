// lib/presentation/country_selection/viewmodel/country_selection_viewmodel.dart

import 'package:get/get.dart';
import 'package:vpn_case_study/core/models/country.dart';
import 'package:vpn_case_study/data/mock/mock_countries.dart';

class CountrySelectionViewModel extends GetxController {
  /// Tüm listelenebilir ülkeler
  final allCountries = <Country>[].obs;

  /// Arama sonucu ile güncellenen liste
  final filteredCountries = <Country>[].obs;

  @override
  void onInit() {
    super.onInit();
    allCountries.assignAll(mockCountries);
    filteredCountries.assignAll(mockCountries);
  }

  /// Arama fonksiyonu: ada veya şehre göre filtrele
  void filter(String query) {
    if (query.isEmpty) {
      filteredCountries.assignAll(allCountries);
    } else {
      final lower = query.toLowerCase();
      filteredCountries.assignAll(
        allCountries.where((c) =>
          c.name.toLowerCase().contains(lower) ||
          c.city.toLowerCase().contains(lower)
        ).toList()
      );
    }
  }
}
