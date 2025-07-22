// lib/presentation/home/widgets/home_header.dart

import 'package:flutter/material.dart';
import 'package:vpn_case_study/shared/widgets/constants.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onLeftIconTap;
  final VoidCallback? onRightIconTap;
  final VoidCallback? onSearchTap;

  const HomeHeader({
    Key? key,
    this.title = 'Countries',
    this.onLeftIconTap,
    this.onRightIconTap,
    this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 190,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/flags/header.png',
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildIconBox(
                        ImageIcon(
                          AssetImage('assets/icons/category.png'),
                          size: 24,
                          color: kTextLight,
                        ),
                        onLeftIconTap,
                      ),
                      const Spacer(),
                      Text(
                        title,
                        style: const TextStyle(
                          color: kTextLight,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      _buildIconBox(
                        ImageIcon(
                          AssetImage('assets/icons/crown.png'),
                          size: 24,
                          color: kTextLight,
                        ),
                        onRightIconTap,
                      ),
                    ],
                  ),
                  const Spacer(),
                  _buildSearchField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconBox(Widget iconWidget, VoidCallback? onTap) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: iconWidget,
        ),
      );

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: 296,
        height: 56,
        child: TextField(
          readOnly: true,
          onTap: onSearchTap,
          decoration: InputDecoration(
            filled: true,
            fillColor: kTextLight,
            hintText: 'Search For Country Or City',
            hintStyle: const TextStyle(color: kTextMedium),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ImageIcon(
                AssetImage('assets/icons/search.png'),
                color: const Color.fromARGB(255, 0, 0, 0),
                size: 20,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
