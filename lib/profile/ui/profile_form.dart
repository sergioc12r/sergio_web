import 'package:flutter/material.dart';
import 'package:sergio_web/common/styles/cu_breakpoints.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/profile/ui/profile_image_widget.dart';
import 'package:sergio_web/profile/ui/profile_info_part.dart';

/// The hero.
///
/// Asymmetric on wide screens — the text takes the measure it needs and the
/// portrait sits in a fixed narrow column — which is what stops this from
/// reading as a centered landing page. It is deliberately not full-viewport:
/// the top of the next section should be visible, so the page announces
/// itself as a document you scroll rather than a splash you dismiss.
class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key, required this.scrollToContact});

  final VoidCallback scrollToContact;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isCompact = CUBreakpoints.isCompact(constraints.maxWidth);

        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileInfoPart(scrollToContact: scrollToContact),
              const SizedBox(height: CUSpacing.s40),
              const ProfileImageWidget(),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ProfileInfoPart(scrollToContact: scrollToContact),
            ),
            const SizedBox(width: CUSpacing.s64),
            const SizedBox(
              width: CUSizing.narrowColumn,
              child: ProfileImageWidget(),
            ),
          ],
        );
      },
    );
  }
}
