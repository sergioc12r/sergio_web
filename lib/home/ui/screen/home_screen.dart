import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sergio_web/app_bar/cu_app_bar.dart';
import 'package:sergio_web/common/widgets/cu_reveal_animation.dart';
import 'package:sergio_web/contact/ui/contact_me_form.dart';
import 'package:sergio_web/education/ui/education_form.dart';
import 'package:sergio_web/experience/ui/experience_form.dart';
import 'package:sergio_web/footer/ui/footer.dart';
import 'package:sergio_web/profile/ui/profile_form.dart';
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

  /// Global keys of all forms widgets
  final GlobalKey _textStackKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          slivers: <Widget>[
            CUAppBar(),
            SliverToBoxAdapter(
              child: ProfileForm(),
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
                    revealOffset: MediaQuery.of(context).size.height * 0.7,
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
                    revealOffset: MediaQuery.of(context).size.height * 0.7,
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
                    revealOffset: MediaQuery.of(context).size.height * 0.7,
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
                    revealOffset: MediaQuery.of(context).size.height * 0.7,
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
    );
  }
}
