import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_case_study/core/models/country.dart';
import 'package:vpn_case_study/presentation/country_selection/view/country_selection_view.dart';
import 'package:vpn_case_study/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:vpn_case_study/presentation/home/widgets/connection_stats_card.dart';
import 'package:vpn_case_study/presentation/home/widgets/country_card.dart';
import 'package:vpn_case_study/presentation/home/widgets/home_header.dart';
import 'package:vpn_case_study/shared/widgets/bottom_nav_bar.dart';
import 'package:vpn_case_study/shared/widgets/constants.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel vm = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    final vm = Get.put(HomeViewModel());

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Obx(() {
          return CustomScrollView(
            slivers: [
              // Üst header ve statik içerik
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    HomeHeader(
                      title: 'Countries',
                      onRightIconTap: () {
                        Get.snackbar('Premium',
                            'Premium ile daha hızlı bağlantı imkanı');
                      },
                      onSearchTap: () async {
                        final selected = await Get.to(
                          () => CountrySelectionView(),
                          transition: Transition.circularReveal,
                          duration: const Duration(milliseconds: 550),
                        );

                        if (selected != null) {
                          vm.connectToCountry(selected);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Connecting Time",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatDuration(vm.connectionStats.value?.connectedTime ??
                          Duration.zero),
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: kTextDark),
                    ),
                    const SizedBox(height: 16),

                    //Seçilen ülkenin gösterilmesi
                    if (vm.connectionStats.value?.connectedCountry != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 56, vertical: 8),
                        child: CountryCard(
                          country: vm.connectionStats.value!.connectedCountry!,
                          isActive: true,
                          onConnect: () => vm.disconnect(),
                        ),
                      ),

                    // Download / Upload
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56),
                      child: Row(
                        children: [
                          Expanded(
                            child: ConnectionStatsCard(
                              icon: ImageIcon(
                                AssetImage('assets/icons/import.png'),
                                size: 22,
                                color: const Color.fromARGB(255, 0, 255, 55),
                              ),
                              label: "Download",
                              value:
                                  "${vm.connectionStats.value?.downloadSpeed ?? 0} MB",
                              iconBgColor: kStatDownloadBg,
                              iconColor: kStatDownload,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ConnectionStatsCard(
                              icon: ImageIcon(
                                AssetImage('assets/icons/export.png'),
                                size: 22,
                                color: const Color.fromARGB(255, 255, 0, 0),
                              ),
                              label: "Upload",
                              value:
                                  "${vm.connectionStats.value?.uploadSpeed ?? 0} MB",
                              iconBgColor: kStatUploadBg,
                              iconColor: kStatUpload,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Free Locations (${vm.countries.length})',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: kTextMedium),
                          ),
                          InkWell(
                            onTap: () =>
                                Get.snackbar('Info', 'Ücretsiz lokasyonlar...'),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: kTextMedium, shape: BoxShape.circle),
                              child: const Icon(Icons.info_outline,
                                  color: Colors.white, size: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Ülke listesi
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final country = vm.countries[index];
                      return CountryCard(
                        country: country,
                        isActive: country.isConnected,
                        onConnect: () {
                          country.isConnected
                              ? vm.disconnect()
                              : vm.connectToCountry(country);
                        },
                      );
                    },
                    childCount: vm.countries.length,
                  ),
                ),
              ),

              //Alt padding
              SliverToBoxAdapter(child: const SizedBox(height: 32)),
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  //saat : dakika : saniye formatında, her bileşeni iki haneli (örneğin 02, 07, 15) bir string’e dönüştürmek için kullanılıyor
  static String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final h = twoDigits(duration.inHours);
    final m = twoDigits(duration.inMinutes.remainder(60));
    final s = twoDigits(duration.inSeconds.remainder(60));
    return "$h : $m : $s";
  }
}
