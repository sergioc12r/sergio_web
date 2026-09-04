import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:sergio_web/about_me/ui/about_me_form.dart';
import 'package:sergio_web/app_bar/cu_app_bar.dart';
import 'package:sergio_web/app_bar/cu_drawer_menu.dart';
import 'package:sergio_web/app_bar/model/app_bar_action_model.dart';
import 'package:sergio_web/common/styles/cu_breakpoints.dart';
import 'package:sergio_web/common/styles/cu_spacing.dart';
import 'package:sergio_web/common/styles/cu_text_styles.dart';
import 'package:sergio_web/common/widgets/cu_reveal_animation.dart';
import 'package:sergio_web/common/widgets/cu_text_link.dart';
import 'package:sergio_web/contact/ui/contact_me_form.dart';
import 'package:sergio_web/education/ui/education_form.dart';
import 'package:sergio_web/experience/ui/experience_form.dart';
import 'package:sergio_web/footer/ui/footer.dart';
import 'package:sergio_web/l10n/app_localizations.dart';
import 'package:sergio_web/profile/ui/profile_form.dart';
import 'package:sergio_web/projects/ui/projects_form.dart';
import 'package:sergio_web/tech_stack/ui/tech_stack_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  /// Stream to listen scroll and animate sections
  final StreamController<double> _scrollStreamController =
      StreamController<double>.broadcast();

  /// Global keys of all forms widgets.
  ///
  /// Each key is used twice — once as the `key` of the section's padding (so
  /// `_animateScroll` can find its offset from the nav) and once as
  /// [RevealAnimator.widgetKey]. Changing which key wraps which section
  /// silently breaks nav scrolling, so the pairing below is load-bearing.
  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _textStackKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  /// Fraction of the viewport a section has to reach before it fades in.
  static const double _revealFraction = 0.9;

  static const Duration _scrollDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    FirebaseAnalytics.instance.logEvent(name: 'visit_home');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollStreamController.close();
    super.dispose();
  }

  /// Listen the scroll position and send it to the stream
  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      _scrollStreamController.sink.add(notification.metrics.pixels);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    /// The nav collapses into the drawer below [CUBreakpoints.expanded]:
    /// six Spanish section names plus the theme pill do not fit on one line
    /// before that, and a wrapped nav is worse than a drawer.
    final bool isLargeScreen = CUBreakpoints.isExpanded(screenWidth);
    final bool isCompact = CUBreakpoints.isCompact(screenWidth);
    final strings = AppLocalizations.of(context)!;

    final double horizontalPadding = isCompact
        ? CUSpacing.sectionHorizontalMobile
        : CUSpacing.sectionHorizontalDesktop;

    final double revealOffset = screenHeight * _revealFraction;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            CUAppBar(
              largeScreen: isLargeScreen,
              actionItems: _mapItems(strings, false),
              onLogoTap: () => _animateScroll(_profileKey),
            ),

            /// Hero. No section number: the page does not introduce itself.
            _Section(
              sectionKey: _profileKey,
              horizontalPadding: horizontalPadding,
              child: ProfileForm(
                scrollToContact: () => _animateScroll(_contactKey),
              ),
            ),

            _Section(
              sectionKey: _aboutMeKey,
              horizontalPadding: horizontalPadding,
              child: RevealAnimator(
                widgetKey: _aboutMeKey,
                scrollStream: _scrollStreamController.stream,
                revealOffset: revealOffset,
                child: const AboutMeForm(index: '01'),
              ),
            ),

            _Section(
              sectionKey: _textStackKey,
              horizontalPadding: horizontalPadding,
              child: RevealAnimator(
                widgetKey: _textStackKey,
                scrollStream: _scrollStreamController.stream,
                revealOffset: revealOffset,
                child: const TextStackForm(index: '02'),
              ),
            ),

            _Section(
              sectionKey: _projectsKey,
              horizontalPadding: horizontalPadding,
              child: RevealAnimator(
                widgetKey: _projectsKey,
                scrollStream: _scrollStreamController.stream,
                revealOffset: revealOffset,
                child: const ProjectsForm(index: '03'),
              ),
            ),

            _Section(
              sectionKey: _experienceKey,
              horizontalPadding: horizontalPadding,
              child: RevealAnimator(
                widgetKey: _experienceKey,
                scrollStream: _scrollStreamController.stream,
                revealOffset: revealOffset,
                child: const ExperienceForm(index: '04'),
              ),
            ),

            _Section(
              sectionKey: _educationKey,
              horizontalPadding: horizontalPadding,
              child: RevealAnimator(
                widgetKey: _educationKey,
                scrollStream: _scrollStreamController.stream,
                revealOffset: revealOffset,
                child: const EducationForm(index: '05'),
              ),
            ),

            _Section(
              sectionKey: _contactKey,
              horizontalPadding: horizontalPadding,
              child: RevealAnimator(
                widgetKey: _contactKey,
                scrollStream: _scrollStreamController.stream,
                revealOffset: revealOffset,
                child: const ContactMeForm(index: '06'),
              ),
            ),

            const SliverToBoxAdapter(child: Footer()),
          ],
        ),
      ),
      endDrawer: isLargeScreen
          ? null
          : CUDrawerMenu(actions: _mapItems(strings, true)),
      endDrawerEnableOpenDragGesture: !isLargeScreen,
    );
  }

  void _animateScroll(GlobalKey key) {
    final context = key.currentContext;

    /// Check widget rendered
    if (context == null) {
      return;
    }

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final ScrollableState scrollableState = Scrollable.of(context);
    final RenderBox scrollableRenderBox =
        scrollableState.context.findRenderObject() as RenderBox;

    final Offset position = renderBox.localToGlobal(
      Offset.zero,
      ancestor: scrollableRenderBox,
    );

    final double targetOffset = position.dy + _scrollController.offset;

    _scrollController.animateTo(
      targetOffset,
      duration: _scrollDuration,
      curve: Curves.easeInOutCubic,
    );
  }

  List<AppBarActionModel> _mapItems(
    AppLocalizations strings,
    bool withCloseDrawer,
  ) {
    return <AppBarActionModel>[
      _buildItem(
        strings.profile_simple_title,
        () => _animateScroll(_profileKey),
        withCloseDrawer,
      ),
      _buildItem(
        strings.about_me_title,
        () => _animateScroll(_aboutMeKey),
        withCloseDrawer,
      ),
      _buildItem(
        strings.tech_stack_title,
        () => _animateScroll(_textStackKey),
        withCloseDrawer,
      ),
      _buildItem(
        strings.simple_projects_title,
        () => _animateScroll(_projectsKey),
        withCloseDrawer,
      ),
      _buildItem(
        strings.simple_experience_title,
        () => _animateScroll(_experienceKey),
        withCloseDrawer,
      ),
      _buildItem(
        strings.simple_education_title,
        () => _animateScroll(_educationKey),
        withCloseDrawer,
      ),
      _buildItem(
        strings.simple_contact_title,
        () => _animateScroll(_contactKey),
        withCloseDrawer,
      ),
    ];
  }

  /// Every nav entry is the same object now — the contact one used to be a
  /// gradient pill, which made it look like the primary action of a page that
  /// has no primary action in its nav.
  AppBarActionModel _buildItem(
    String title,
    VoidCallback onTap,
    bool withCloseDrawer,
  ) {
    return AppBarActionModel(
      title: title,
      child: Builder(
        builder: (innerContext) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: CUSpacing.s8),
            child: CUTextLink(
              label: title,
              style: CUTextStyles.monoLabel,
              onTap: () {
                onTap();
                if (withCloseDrawer) {
                  Scaffold.of(innerContext).closeEndDrawer();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

/// One page section: the vertical rhythm, the horizontal gutters and the
/// maximum measure, applied identically everywhere so the sections line up
/// with each other down the whole page.
class _Section extends StatelessWidget {
  const _Section({
    required this.sectionKey,
    required this.horizontalPadding,
    required this.child,
  });

  final GlobalKey sectionKey;
  final double horizontalPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        key: sectionKey,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: CUSpacing.sectionVertical / 2,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: CUSizing.maxContentWidth,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
