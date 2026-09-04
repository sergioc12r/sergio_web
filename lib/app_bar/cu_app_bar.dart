import 'package:flutter/material.dart';
import 'package:sergio_web/app_bar/model/app_bar_action_model.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/l10n/app_localizations.dart';

/// The site nav, as a pinned [SliverAppBar].
///
/// A 64dp rule across the top: mono wordmark on the left, mono links on the
/// right. The gradient tile that used to sit in `leading` is gone — the
/// wordmark IS the logo, and it doubles as the "back to top" affordance.
class CUAppBar extends StatelessWidget {
  const CUAppBar({
    super.key,
    required this.largeScreen,
    required this.actionItems,
    this.onLogoTap,
  });

  final bool largeScreen;
  final List<AppBarActionModel> actionItems;
  final VoidCallback? onLogoTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final strings = AppLocalizations.of(context)!;

    final List<Widget> actions = <Widget>[
      if (largeScreen)
        for (final AppBarActionModel item in actionItems) item.child
      else
        DrawerButton(onPressed: () => Scaffold.of(context).openEndDrawer()),
      const SizedBox(width: CUSpacing.sectionHorizontalMobile),
    ];

    return SliverAppBar(
      pinned: true,
      floating: false,
      toolbarHeight: CUSizing.toolbarHeight,
      automaticallyImplyLeading: false,
      backgroundColor: colors.surface,
      title: _Wordmark(label: strings.appTitle, onTap: onLogoTap),
      actions: actions,
    );
  }
}

/// The wordmark. Mono, uppercase, tracked out — it reads as a filename, which
/// is the whole register of this site.
class _Wordmark extends StatefulWidget {
  const _Wordmark({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  State<_Wordmark> createState() => _WordmarkState();
}

class _WordmarkState extends State<_Wordmark> {
  bool _hovering = false;

  static const Duration _feedback = Duration(milliseconds: 150);

  void _setHover(bool value) {
    if (_hovering == value) return;
    setState(() => _hovering = value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final Widget label = AnimatedDefaultTextStyle(
      duration: _feedback,
      curve: Curves.easeOutCubic,
      style: CUTextStyles.monoSectionNumber.copyWith(
        color: _hovering && widget.onTap != null
            ? colors.primary
            : colors.onSurface,
      ),
      child: Text(widget.label.toUpperCase()),
    );

    if (widget.onTap == null) {
      return label;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: CUSizing.minTapTarget),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            widthFactor: 1,
            child: label,
          ),
        ),
      ),
    );
  }
}
