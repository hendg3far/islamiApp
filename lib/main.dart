import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/home_screen.dart';
import 'package:islamic/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islamic/tabs/quran/quran_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/providers/app_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfig(),
      child: IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetailsScreen.routeName: (context) => QuranDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      themeMode: provider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.language),
    );
  }
}
