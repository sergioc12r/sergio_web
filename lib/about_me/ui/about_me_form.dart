import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sergio_web/about_me/ui/relevant_item_card.dart';
import 'package:sergio_web/common/data/utils_urls.dart';
import 'package:sergio_web/common/widgets/cu_chip.dart';
import 'package:sergio_web/common/widgets/cu_title.dart';
import 'package:sergio_web/providers/providers.dart';

class AboutMeForm extends ConsumerWidget {
  const AboutMeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 800;

    final data = ref.watch(aboutMeProvider);
    final textTheme = Theme.of(context).textTheme;

    final textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 30,
      children: [
        Text(data?.description ?? '', style: textTheme.bodyMedium),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: List.generate(data?.techItems.length ?? 0, (index) {
            return CUChip(text: data?.techItems[index] ?? '');
          }),
        ),
      ],
    );

    final imageContent = Container(
      width: isWideScreen ? 400 : double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          data?.imageUrl ?? UtilsUrls.aboutImage,
          fit: BoxFit.cover,
        ),
      ),
    );

    final mainLayout = isWideScreen
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: imageContent,
              ),
              Expanded(child: textContent),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [
              textContent,
              imageContent,
            ],
          );

    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            CUTitle(
              title: data?.title ?? '',
            ),
            const SizedBox(height: 8),
            Text(
              data?.subTitle ?? '',
              style: Theme.of(context).textTheme.bodySmall
            ),
            const SizedBox(height: 40),
            mainLayout,
            const SizedBox(height: 50),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.center,
              children: data!.relevantItems
                  .map((item) => RelevantItemCard(item: item))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
