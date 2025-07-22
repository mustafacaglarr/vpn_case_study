// lib/presentation/country_selection/view/country_selection_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_case_study/presentation/country_selection/viewmodel/country_selection_viewmodel.dart';
import 'package:vpn_case_study/presentation/country_selection/widgets/country_selection_tile.dart';
import 'package:vpn_case_study/shared/widgets/constants.dart';

class CountrySelectionView extends StatelessWidget {
  final vm = Get.put(CountrySelectionViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kHeaderBlue,
        elevation: 0,
        title: const Text('Select Country', style: TextStyle(color: kTextLight)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: kTextLight),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            // 1) Arama Çubuğu
            SizedBox(
              height: 56,
              child: TextField(
                onChanged: vm.filter,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kTextLight,
                  hintText: 'Search for country or city',
                  hintStyle: const TextStyle(color: kTextMedium),
                  prefixIcon: const Icon(Icons.search, color: kTextMedium),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 2) Liste
            Expanded(
              child: Obx(() {
                final list = vm.filteredCountries;
                if (list.isEmpty) {
                  return const Center(
                    child: Text('No results found', style: TextStyle(color: kTextMedium)),
                  );
                }
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final country = list[i];
                    return CountrySelectionTile(
                      country: country,
                      onTap: () {
                        // Seçimi geri gönder, ana ekranda işlemek istersen:
                        Get.back(result: country);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
