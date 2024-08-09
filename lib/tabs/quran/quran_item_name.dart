import 'package:flutter/material.dart';
import 'package:islamic/tabs/quran/quran_details_screen.dart';

class QuranItemName extends StatelessWidget {

  String name;
  int index;

  QuranItemName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(QuranDetailsScreen.routeName,
            arguments: QuranDetailsArgs(name: name, index: index)
        );
      },
      child: Text(name,
        style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
    );
  }
}
