import 'package:flutter/material.dart';
import 'package:pickanddrop/utils/util.dart';
import 'package:pickanddrop/components/text.dart';

class CheckOut extends StatelessWidget {
  final String pick_date;
  final String drop_date;
  final String pick_location;
  final String drop_location;

  const CheckOut({
    super.key, 
    required this.pick_date, 
    required this.drop_date, 
    required this.pick_location, 
    required this.drop_location
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Card(
                    child: Column(
                      children: [
                        Text("Pick date: ${pick_date}"),
                        Text("Pick location: ${pick_location}"),
                        Text("Drop date: ${drop_date}"),
                        Text("Drop location: ${drop_location}")
                      ],
                    )
                  )
              )
            ]
          ),
        ),
    );
  }
}