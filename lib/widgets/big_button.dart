import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({super.key, required this.tapFun, required this.description});
  final void Function()? tapFun;
  final String description;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsetsGeometry.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      margin: EdgeInsetsGeometry.fromLTRB(20, 20, 20, 0),
      width: double.infinity,
      child: InkWell(
        onTap: tapFun,
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              description,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
