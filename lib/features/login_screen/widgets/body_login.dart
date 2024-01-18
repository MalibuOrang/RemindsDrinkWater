import 'package:flutter/material.dart';
import '../../../consts/icon_const.dart';
import '../../../generated/l10n.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key, required this.theme});
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          signInIcon,
          height: 150,
          width: 150,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(S.of(context).welcome, style: theme.textTheme.bodyMedium),
        const SizedBox(
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(S.of(context).continueWith,
              style: theme.textTheme.labelSmall),
        ),
      ],
    );
  }
}
