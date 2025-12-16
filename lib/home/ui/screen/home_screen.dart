import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sergio_web/about_me/ui/about_me_form.dart';
import 'package:sergio_web/app_bar/cu_app_bar.dart';
import 'package:sergio_web/app_bar/cu_drawer_menu.dart';
import 'package:sergio_web/app_bar/model/app_bar_action_model.dart';
import 'package:sergio_web/common/widgets/cu_gradient_button.dart';
import 'package:sergio_web/common/widgets/cu_reveal_animation.dart';
import 'package:sergio_web/common/widgets/cu_transparent_button.dart';
import 'package:sergio_web/contact/ui/contact_me_form.dart';
import 'package:sergio_web/education/ui/education_form.dart';
import 'package:sergio_web/experience/ui/experience_form.dart';
import 'package:sergio_web/footer/ui/footer.dart';
import 'package:sergio_web/profile/ui/profile_form.dart';
import 'package:sergio_web/tech_stack/ui/tech_stack_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  /// Global keys of all forms widgets
  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _textStackKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  /// double size to change the appBar
  final double _appBarSize = 800.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    FirebaseAnalytics.instance.logEvent(
      name: 'visit_home',
    );
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
    const double spacing = 100;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= _appBarSize;
    final strings = AppLocalizations.of(context)!;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          slivers: <Widget>[
            CUAppBar(
              largeScreen: isLargeScreen,
              actionItems: _mapItems(strings,false),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing),
            ),
            SliverToBoxAdapter(
              child: Padding(
                key: _profileKey,
                padding: const EdgeInsets.all(8.0),
                child: ProfileForm(
                  scrollToContact: () => _animateScroll(_contactKey),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing),
            ),
            SliverToBoxAdapter(
              child: Padding(
                key: _aboutMeKey,
                padding: const EdgeInsets.all(8.0),
                child: RevealAnimator(
                    widgetKey: _aboutMeKey,
                    scrollStream: _scrollStreamController.stream,
                    revealOffset: MediaQuery.of(context).size.height * 0.9,
                    child: AboutMeForm()),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing),
            ),
            SliverToBoxAdapter(
              child: Padding(
                key: _textStackKey,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: RevealAnimator(
                    widgetKey: _textStackKey,
                    scrollStream: _scrollStreamController.stream,
                    revealOffset: MediaQuery.of(context).size.height * 0.9,
                    child: TextStackForm()),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing),
            ),
            SliverToBoxAdapter(
              child: Padding(
                key: _experienceKey,
                padding: const EdgeInsets.all(20.0),
                child: RevealAnimator(
                    widgetKey: _experienceKey,
                    scrollStream: _scrollStreamController.stream,
                    revealOffset: MediaQuery.of(context).size.height * 0.9,
                    child: ExperienceForm()),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing),
            ),
            SliverToBoxAdapter(
              child: Padding(
                key: _educationKey,
                padding: const EdgeInsets.all(20.0),
                child: RevealAnimator(
                    widgetKey: _educationKey,
                    scrollStream: _scrollStreamController.stream,
                    revealOffset: MediaQuery.of(context).size.height * 0.9,
                    child: EducationForm()),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing),
            ),
            SliverToBoxAdapter(
              child: Padding(
                key: _contactKey,
                padding: const EdgeInsets.all(20.0),
                child: RevealAnimator(
                    widgetKey: _contactKey,
                    scrollStream: _scrollStreamController.stream,
                    revealOffset: MediaQuery.of(context).size.height * 0.9,
                    child: ContactMeForm()),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: spacing),
            ),
            const SliverToBoxAdapter(
              child: Footer(),
            ),
          ],
        ),
      ),
      endDrawer: isLargeScreen
          ? null
          : CUDrawerMenu(
              actions: _mapItems(strings, true),
            ),
      endDrawerEnableOpenDragGesture: !isLargeScreen,
    );
  }

  void _animateScroll(GlobalKey key) {
    final context = key.currentContext;

    /// Check widget rendered
    if (context == null) {
      return;
    }

    /// Get renderBox
    final RenderBox renderBox = context.findRenderObject() as RenderBox;

    /// Get scrollable state of widget
    final ScrollableState scrollableState = Scrollable.of(context);

    /// Get the scrollable render box
    final RenderBox scrollableRenderBox =
    scrollableState.context.findRenderObject() as RenderBox;

    /// Get global position in the scroll
    final Offset position = renderBox.localToGlobal(
      Offset.zero,
      ancestor: scrollableRenderBox,
    );

    /// calculate the offset
    final double targetOffset = position.dy + _scrollController.offset;

    /// animate scroll
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    ).then((_){
      SchedulerBinding.instance.addPostFrameCallback((_) {
        debugPrint('loaded');
      });
    });
  }

  List<AppBarActionModel> _mapItems(AppLocalizations strings, bool withCloseDrawer) {
    List<AppBarActionModel> items = [];
    items.add(_buildBasicItem(
        strings.profile_simple_title, () => _animateScroll(_profileKey),withCloseDrawer));
    items.add(_buildBasicItem(
        strings.about_me_title, () => _animateScroll(_aboutMeKey),withCloseDrawer));
    items.add(_buildBasicItem(
        strings.tech_stack_title, () => _animateScroll(_textStackKey),withCloseDrawer));
    items.add(_buildBasicItem(
        strings.simple_experience_title, () => _animateScroll(_experienceKey),withCloseDrawer));
    items.add(_buildBasicItem(
        strings.simple_education_title, () => _animateScroll(_educationKey),withCloseDrawer));
    items.add(_buildButtonItem(
        strings.simple_contact_title, () => _animateScroll(_contactKey),withCloseDrawer));
    return items;
  }

  AppBarActionModel _buildBasicItem(String title, Function() onTap, bool withCloseDrawer) {
    return AppBarActionModel(
        title: title,
        child: Builder(
          builder: (innerContext) {
            return CUTransparentButton(
                onTap: (){
                  onTap();
                  if(withCloseDrawer){
                    Scaffold.of(innerContext).closeEndDrawer();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
                ));
          }
        ));
  }

  AppBarActionModel _buildButtonItem(String title, Function() onTap,bool withCloseDrawer) {
    return AppBarActionModel(
        title: title,
        child: Builder(
          builder: (innerContext) {
            return Container(
                constraints: BoxConstraints(maxWidth: 140),
                child: CUGradientButton(callback: (){
                  onTap();
                  if(withCloseDrawer){
                    Scaffold.of(innerContext).closeEndDrawer();
                  }
                }, title: title));
          }
        ));
  }
}
