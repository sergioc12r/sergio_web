import 'package:flutter/material.dart';
import 'package:sergio_web/app_bar/model/app_bar_action_model.dart';

class CUDrawerMenu extends StatelessWidget {
  const CUDrawerMenu({super.key, required this.actions});

  final List<AppBarActionModel> actions;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: List.generate(actions.length, (index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: actions.elementAt(index).child,
          );
        }),
      ),
    );
  }
}
