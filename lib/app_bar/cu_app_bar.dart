import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sergio_web/app_bar/model/app_bar_action_model.dart';

/// Custom App Bar with [SliverAppBar] form
class CUAppBar extends StatelessWidget {
  const CUAppBar(
      {super.key, required this.largeScreen, required this.actionItems});

  final bool largeScreen;
  final List<AppBarActionModel> actionItems;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    List<Widget> actions = [];
    if (largeScreen) {
      for (var item in actionItems) {
        actions.add(item.child);
      }
    } else {
      actions.add(DrawerButton(
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
      ));
    }
    actions.add(const SizedBox(width: 20));

    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      title: Text(strings.appTitle, style: textTheme.headlineSmall),
      automaticallyImplyLeading: true,
      actions: actions,
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
