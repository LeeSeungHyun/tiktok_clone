import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileInfo extends StatelessWidget {
  final String total;
  final String item;

  const UserProfileInfo({
    super.key,
    required this.total,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          total,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v3,
        Text(
          item,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        )
      ],
    );
  }
}
