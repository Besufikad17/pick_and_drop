import 'package:flutter/material.dart';
import 'package:pickanddrop/components/text.dart';
import 'package:pickanddrop/utils/util.dart';
import 'package:pickanddrop/components/calendar/ethiopiancalendar.dart';
import 'package:pickanddrop/components/calendar/gregoriancalendar.dart';

class Date extends StatelessWidget {
  final Function(String, String) onPressed;
  final String flag;

  const Date({super.key, required this.onPressed, required this.flag});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: getColorFromHex("#165214"),
          title: MyText(
            text: "Date picker", 
            bgcolor: "#165214", 
            fgcolor: "#FFFFFF", 
            borderRadius: 0, 
            size: 18,
            isBold: true,
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: "ኢአ",),
              Tab(text: "GC",),
            ],
          ),
        ),
        backgroundColor: getColorFromHex("#FFFFFF"),
        body: TabBarView(
            children: [
              ETC(flag: flag, onPressed: (date, flag) => onPressed(date, flag),),
              GC(flag: flag, onPressed: (date, flag) => onPressed(date, flag),),
            ],
          ),
      )
      )
    );
  }
}