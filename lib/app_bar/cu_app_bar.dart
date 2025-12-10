import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Custom App Bar with [SliverAppBar] form
class CUAppBar extends StatelessWidget {
  const CUAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      title: Text(strings.appTitle, style: textTheme.headlineSmall),
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
      leading: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF3B59FF),
                Color(0xFF00C6FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.devices_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
