import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:islamic/providers/app_config.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.02,
        vertical: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              DropdownButton<String>(
                  value: provider.language,
                  style: Theme.of(context).textTheme.bodySmall,
                  dropdownColor: Theme.of(context).primaryColor,
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('English'),
                      onTap: () {
                        provider.changeLanguage('en');
                      },
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text('العربية'),
                      onTap: () {
                        provider.changeLanguage('ar');
                      },
                    ),
                  ],
                  onChanged: (value) {
                    provider.changeLanguage(value!);
                  }),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.theme,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Switch(
                value: provider.appTheme == ThemeMode.light ? true : false,
                activeTrackColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Colors.grey,
                dragStartBehavior: DragStartBehavior.down,
                onChanged: (bool value) {
                  provider.changeThemeMode(
                      value ? ThemeMode.light : ThemeMode.dark);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
