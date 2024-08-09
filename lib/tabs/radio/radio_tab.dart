import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radio.png'),
        Text(
          AppLocalizations.of(context)!.radio_title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/icon_prev.png'),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/icon_play.png'),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/icon_next.png'),
          ),
        ])
      ],
    );
  }
}
