import 'package:flutter/material.dart';
import 'package:islamic/providers/app_config.dart';
import 'package:islamic/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/radio/radio_tab.dart';
import 'package:islamic/tabs/sebha/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image:  AssetImage( provider.appTheme == ThemeMode.light
                ? 'assets/images/bg.png'
                : 'assets/images/bg-dark.png'
            ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),

        body: tabs[selectedIndex],

        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_quran.png'),
                ),
                label: AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_hadeth.png'),
                ),
                label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_sebha.png'),
                ),
                label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_radio.png'),
                ),
                label: AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
