import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/hadeth/hadeth_item_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    loadFile();
    return Column(
      children: [
        Image(
          image: const AssetImage('assets/images/hadeth_logo_image.png'),
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        const SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 3,
          color: AppTheme.primaryLightColor,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Divider(
          thickness: 3,
          color: AppTheme.primaryLightColor,
        ),
        Expanded(
          child: ahadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView.builder(
                  itemCount: ahadethList.length,
                  itemBuilder: (_, index) {
                    return HadethItemName(hadeth: ahadethList[index]);
                  },
                ),
        ),
      ],
    );
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/hadeth/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');

    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);

      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
