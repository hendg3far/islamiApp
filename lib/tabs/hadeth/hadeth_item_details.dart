import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeth/hadeth_tab.dart';

class HadethItemDetails extends StatelessWidget {
 String content;

 HadethItemDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(content,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
