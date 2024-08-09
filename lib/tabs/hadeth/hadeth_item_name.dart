import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islamic/tabs/hadeth/hadeth_tab.dart';
import 'package:islamic/tabs/quran/quran_details_screen.dart';

class HadethItemName extends StatelessWidget {

  Hadeth hadeth;

  HadethItemName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
        arguments: hadeth);
      },
      child: Text(hadeth.title,
        style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
    );
  }
}
