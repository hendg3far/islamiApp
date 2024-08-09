import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/app_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _angle = 0;
  int counter = 0;

  String zekr = '';

  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله أكبر',
    'لا حول ولا قوة الا بالله'
  ];

  @override
  void initState() {
    super.initState();
    zekr = azkar[0];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
              transform: Matrix4.translationValues(0, 12, 0),
              child: Image.asset('assets/images/head_seb7a.png')),
          LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: () => setState(() {
                  _angle += pi / 36;
                  counter++;
                  getZekr();
                }),
                child: Transform.rotate(
                    angle: _angle,
                    child: Image.asset('assets/images/body_seb7a.png')),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.tasbe7_num,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            width: 69,
            height: 81,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              child: Text(zekr, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.whiteColor
              ))),
        ],
      ),
    );
  }

  void getZekr() {
    int index = (counter ~/ 33) % azkar.length;
    zekr = azkar[index];
  }
}
