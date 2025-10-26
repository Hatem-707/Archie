import 'package:archie/controllers/page_provider.dart';
import 'package:archie/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, provider, child) {
        return NavigationBar(
          indicatorColor: theme.colorScheme.inversePrimary,
          selectedIndex: provider.currentPage,
          onDestinationSelected: (value) {
            provider.changePage(value);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home, color: theme.colorScheme.primary),
              label: "Home",
            ),
            NavigationDestination(
              icon: SvgIcon(
                assetPath: "assets/icons/yoga.svg",
                color: theme.colorScheme.primary,
              ),
              label: "Excercises",
            ),
            NavigationDestination(
              icon: SvgIcon(
                assetPath: "assets/icons/shoes.svg",
                color: theme.colorScheme.primary,
              ),
              label: "shoes",
            ),
          ],
        );
      },
    );
  }
}
