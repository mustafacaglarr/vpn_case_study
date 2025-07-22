import 'package:flutter/material.dart'; // constants.dart'ı ekle!
import 'package:vpn_case_study/shared/widgets/constants.dart';
import '../../../core/models/country.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final bool isActive;
  final VoidCallback? onConnect;

  const CountryCard({
    Key? key,
    required this.country,
    this.isActive = false,
    this.onConnect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: kTextLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Bayrak
          Image.asset(
            country.flag,
            width: 36,
            height: 36,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 14),
          // Ülke adı ve location count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country.name,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16,
                    color: kTextDark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${country.locationCount} Locations',
                  style: const TextStyle(
                    fontFamily: 'Gilroy', 
                    fontSize: 13,
                    color: kTextMedium, 
                  ),
                ),
              ],
            ),
          ),
          // Power buton
          InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: onConnect,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isActive ? kHeaderBlue : kBackgroundColor,
                border: Border.all(
                  color: isActive ? kHeaderBlue : kBackgroundColor,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.power_settings_new,
                color: isActive ? kTextLight : kTextDark,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
         
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: kTextDark,
            ),
          ),
        ],
      ),
    );
  }
}
