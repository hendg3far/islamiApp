import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/providers/app_config.dart';
import 'package:islamic/tabs/quran/quran_item_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = 'quran_details_screen';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfig>(context);

    QuranDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as QuranDetailsArgs;

    if (verses.isEmpty) {
      loadAsset(args.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.appTheme == ThemeMode.light
              ? 'assets/images/bg.png'
              : 'assets/images/bg-dark.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
          decoration: BoxDecoration(
            // color: const Color(0xFFF8F8F8).withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    args.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.play_circle),
                ],
              ),
              Divider(
                thickness: 1,
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (_, index) {
                      return QuranItemDetails(
                          content: verses[index], index: index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loadAsset(int index) async {
    String content =
        await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class QuranDetailsArgs {
  String name;
  int index;

  QuranDetailsArgs({required this.name, required this.index});
}
