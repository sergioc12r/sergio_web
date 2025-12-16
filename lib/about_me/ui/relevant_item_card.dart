import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sergio_web/about_me/model/about_me_model.dart';
import 'package:sergio_web/common/widgets/glass_card.dart';

class RelevantItemCard extends StatelessWidget {
  const RelevantItemCard({super.key, required this.item});

  final RelevantItemModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GlassCard(
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _checkAsset(item.iconUrl),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              item.subTitle,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkAsset(String? url) {
    if (url?.isEmpty ?? true) {
      return const SizedBox();
    }

    if (url!.contains('http')) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF3B59FF),
                Color(0xFF00C6FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.network(
              url,
              width: 40,
              height: 40,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ));
    }

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF3B59FF),
              Color(0xFF00C6FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            url,
            width: 40,
            height: 40,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ));
  }
}
