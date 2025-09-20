import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.controller,
    required this.hideInput,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool hideInput;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsetsGeometry.fromLTRB(20, 20, 20, 0),
      child: TextField(
        controller: controller,
        obscureText: hideInput,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: theme.colorScheme.primaryContainer,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: theme.colorScheme.onPrimary,
              width: 2.0,
            ),
          ),
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
