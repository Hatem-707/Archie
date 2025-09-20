import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FactScreen extends StatelessWidget {
  final List<FactItem> facts = [
    FactItem(
      title: "What is Flat Foot?",
      description:
          "Flat feet, also known as fallen arches, is a condition where the arches of the feet collapse, with the entire sole of the foot touching the ground when standing.",
      svgPath: "assets/icons/foot_print.svg",
    ),
    FactItem(
      title: "Common Symptoms",
      description:
          "Pain in the heel or arch area, swelling along the inside of the ankle, foot fatigue, and difficulty standing on tiptoe.",
      svgPath: "assets/icons/pain.svg",
    ),
    FactItem(
      title: "Causes",
      description:
          "Genetics, arthritis, tendon injuries, nerve conditions, or simply the arches not developing during childhood.",
      svgPath: "assets/icons/joint.svg",
    ),
    FactItem(
      title: "Treatment Options",
      description:
          "Arch supports, stretching exercises, supportive shoes, physical therapy, and in severe cases, surgery.",
      svgPath: "assets/icons/therapy.svg",
    ),
    FactItem(
      title: "Daily Exercises",
      description:
          "Heel stretches, arch lifts, towel curls, and calf raises can help strengthen foot muscles and improve arch support.",
      svgPath: "assets/icons/exercise.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "Understanding Flat Feet",
              style: theme.textTheme.headlineMedium!.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Container(
              color: colorScheme.primary,
              child: SvgPicture.asset(
                "assets/icons/walking.svg",
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  colorScheme.onPrimary.withAlpha(125),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          backgroundColor: colorScheme.primary,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Facts About Flat Foot Condition",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _buildFactCard(facts[index], colorScheme, theme);
          }, childCount: facts.length),
        ),
      ],
    );
  }

  Widget _buildFactCard(
    FactItem fact,
    ColorScheme colorScheme,
    ThemeData theme,
  ) {
    final Widget pic;
    if (!kDebugMode) {
      pic = SvgPicture.asset(
        fact.svgPath,
        colorFilter: ColorFilter.mode(colorScheme.onPrimary, BlendMode.srcIn),
      );
    } else {
      pic = Image.asset("assets/images/placeHolder.jpg", fit: BoxFit.cover);
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: pic,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fact.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    fact.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FactItem {
  final String title;
  final String description;
  final String svgPath;

  FactItem({
    required this.title,
    required this.description,
    required this.svgPath,
  });
}
