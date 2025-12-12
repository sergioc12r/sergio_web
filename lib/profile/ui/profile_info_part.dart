import 'package:flutter/material.dart';
import 'package:sergio_web/profile/ui/availability_card.dart';
import 'package:sergio_web/profile/ui/header_info.dart';

class ProfileInfoPart extends StatelessWidget {
  const ProfileInfoPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [const AvailabilityCard(), const HeaderInfo()],
    );
  }
}
