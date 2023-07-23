import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/widgets/video_config/dark_mode_config.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
    required this.selectedIndex,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeConfig,
      builder: (context, value, child) => Expanded(
        child: GestureDetector(
          onTap: () => onTap(),
          child: Container(
            color: selectedIndex == 0 || value ? Colors.black : Colors.white,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isSelected ? 1 : 0.6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    isSelected ? selectedIcon : icon,
                    color: selectedIndex == 0 || value
                        ? Colors.white
                        : Colors.black,
                  ),
                  Gaps.v5,
                  Text(
                    text,
                    style: TextStyle(
                      color: selectedIndex == 0 || value
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
