import 'package:flutter/material.dart';
import 'package:sergio_web/profile/ui/header_info.dart';

/// Text column of the hero.
///
/// The availability line used to be stacked here as a sibling of the
/// headline; it now belongs to [HeaderInfo] so the whole written block has a
/// single owner and one vertical rhythm.
class ProfileInfoPart extends StatelessWidget {
  const ProfileInfoPart({super.key, required this.scrollToContact});

  final VoidCallback scrollToContact;

  @override
  Widget build(BuildContext context) {
    return HeaderInfo(scrollToContact: scrollToContact);
  }
}
