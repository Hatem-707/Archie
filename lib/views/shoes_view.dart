import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShoesView extends StatelessWidget {
  final List<ShoeRecommendation> shoes = [
    ShoeRecommendation(
      name: "Brooks Adrenaline GTS 24",
      manufacturer: "Brooks Running",
      description:
          "Features GuideRails technology that provides support without overcorrecting motion. Offers balanced cushioning with a firm midsole for stability.",
      features: "GuideRails technology, Balanced cushioning, 39.0mm heel stack",
      storeUrl: "https://www.brooksrunning.com",
      image: Image.asset("assets/images/Brooks.jpg"),
    ),
    ShoeRecommendation(
      name: "Saucony Guide 18",
      manufacturer: "Saucony",
      description:
          "Offers a stable yet non-restrictive ride with a broad platform. Features PWRRUN PB insole for cushioning and rocker geometry.",
      features: "PWRRUN PB insole, Broad platform, Lightweight design",
      storeUrl: "https://www.saucony.com",
      image: Image.asset("assets/images/Guide18.jpg"),
    ),
    ShoeRecommendation(
      name: "ASICS Gel-Kayano 32",
      manufacturer: "ASICS",
      description:
          "Boasts exceptional shock absorption with a 4D Guidance System that adapts to foot shape to support the arch.",
      features: "Gel technology, 4D Guidance System, Excellent traction",
      storeUrl: "https://www.asics.com",
      image: Image.asset("assets/images/Kayano32.jpg"),
    ),
    ShoeRecommendation(
      name: "Brooks Addiction Walker 2",
      manufacturer: "Brooks Running",
      description:
          "Leather walking shoe with immense support and security. Features GuideRails technology and roomy toe box.",
      features: "Leather construction, GuideRails technology, Roomy toe box",
      storeUrl: "https://www.brooksrunning.com",
      image: Image.asset("assets/images/wlaker2.jpg"),
    ),
    ShoeRecommendation(
      name: "Hoka Gaviota 5",
      manufacturer: "Hoka",
      description:
          "Designed specifically for flat and wide feet with H-Frame technology for stability and a spacious base.",
      features: "H-Frame technology, Spacious base, Plush cushioning",
      storeUrl: "https://www.hoka.com",
      image: Image.asset("assets/images/Gaviota5.jpg"),
    ),
    ShoeRecommendation(
      name: "Hoka Arahi 7",
      manufacturer: "Hoka",
      description:
          "Lightweight stability shoe with J-Frame technology that ensures proper foot alignment without heavy traditional stability elements.",
      features: "J-Frame technology, Lightweight, Extra-wide platform",
      storeUrl: "https://www.hoka.com",
      image: Image.asset("assets/images/Arahi7.jpg"),
    ),
    ShoeRecommendation(
      name: "Drew Chippy Athletic Shoes",
      manufacturer: "Drew Shoes",
      description:
          "Therapeutic shoes with double depth construction and two removable insoles to accommodate orthotics.",
      features: "Double depth, Removable insoles, Diabetic-friendly",
      storeUrl: "https://www.drewshoe.com",
      image: Image.asset("assets/images/Drew.jpg"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "Recommended Footwear",
              style: TextStyle(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Container(color: colorScheme.primary),
          ),
          backgroundColor: colorScheme.primary,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Top Shoe Recommendations for Flat Feet",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _buildShoeCard(shoes[index], colorScheme, theme, context);
          }, childCount: shoes.length),
        ),
      ],
    );
  }

  Widget _buildShoeCard(
    ShoeRecommendation shoe,
    ColorScheme colorScheme,
    ThemeData theme,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shoe name and manufacturer
            Text(
              shoe.name,
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              "by ${shoe.manufacturer}",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),

            // Separator
            const Divider(thickness: 1.0, height: 24.0),

            // Description
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8.0),
                    child: shoe.image,
                  ),
                ),
                Flexible(
                  child: Text(
                    shoe.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),

            // Key features with bullet points
            Text(
              "Key Features:",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            ...shoe.features
                .split(', ')
                .map(
                  (feature) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 2.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ",
                          style: TextStyle(color: colorScheme.primary),
                        ),
                        Expanded(
                          child: Text(
                            feature,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),

            // Separator
            const Divider(thickness: 1.0, height: 24.0),

            // Store link button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _launchUrl(shoe.storeUrl, context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: const Text("View Product"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }
}

class ShoeRecommendation {
  final String name;
  final String manufacturer;
  final String description;
  final String features;
  final String storeUrl;
  final Image image;

  ShoeRecommendation({
    required this.name,
    required this.manufacturer,
    required this.description,
    required this.features,
    required this.storeUrl,
    required this.image,
  });
}
