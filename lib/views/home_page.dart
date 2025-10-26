import 'package:archie/auth/auth_service.dart';
import 'package:archie/controllers/page_provider.dart';
import 'package:archie/views/excercises_view.dart';
import 'package:archie/views/facts_view.dart';
import 'package:archie/views/settings_page.dart';
import 'package:archie/views/shoes_view.dart';
import 'package:archie/widgets/my_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout(BuildContext context) {
    final _authService = AuthService();
    _authService.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<PageProvider>(
      builder: (context, provider, child) {
        final Widget mainView;
        if (provider.currentPage == 0) {
          mainView = FactScreen();
        } else if (provider.currentPage == 1) {
          mainView = ExercisesView();
        } else {
          mainView = ShoesView();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Archie",
              style: theme.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SettingsPage();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          body: mainView,
          bottomNavigationBar: MyNavBar(theme: theme),
        );
      },
    );
  }
}
