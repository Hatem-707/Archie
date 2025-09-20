import 'package:feetly/auth/auth_service.dart';
import 'package:feetly/controllers/theme_provider.dart';
import 'package:feetly/views/change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void logout(BuildContext context) {
    final _authService = AuthService();
    _authService.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        final theme = Theme.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(
              "Settings",
              style: theme.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            color: theme.colorScheme.surfaceContainerLowest,
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Toggle dark mode",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                      CupertinoSwitch(
                        activeTrackColor:
                            theme.colorScheme.onSecondaryContainer,
                        inactiveTrackColor: theme.colorScheme.inversePrimary,
                        value: provider.darkMode,
                        onChanged: (value) {
                          provider.toggleThemeMode();
                        },
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  color: theme.colorScheme.onSurface,
                  thickness: 4,
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Change Password",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: theme.colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  color: theme.colorScheme.onSurface,
                  thickness: 4,
                  width: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Logout",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          logout(context);
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.logout,
                          color: theme.colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
