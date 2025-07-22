// lib/presentation/country_selection/widgets/country_selection_tile.dart

import 'package:flutter/material.dart';
import 'package:vpn_case_study/core/models/country.dart';
import 'package:vpn_case_study/shared/widgets/constants.dart';

class CountrySelectionTile extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountrySelectionTile({
    Key? key,
    required this.country,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: kTextLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Row(
          children: [
            Image.asset(
              country.flag,
              width: 36,
              height: 36,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kTextDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${country.locationCount} Locations',
                    style: const TextStyle(
                      fontSize: 13,
                      color: kTextMedium,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: kTextMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
