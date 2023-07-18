import 'package:flutter/material.dart';
import 'package:pickanddrop/components/button.dart';
import 'package:pickanddrop/components/text.dart';

import 'utils/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick/Drop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: getColorFromHex("#165214")),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pick/Drop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pick_date = "Pick Date";
  String pick_location = "Pick Location";
  String drop_date = "Drop Date";
  String drop_location = "Drop Location";

  void done() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: getColorFromHex("#FFFFFF"),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            MyText(text: "PickUp Information", size: 20, bgcolor: "#FFFFFF", borderRadius: 0),
            const SizedBox(height: 20),
            Container( 
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: getColorFromHex("#000000"),
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  color: getColorFromHex("#FFFFFF"),
                  child: Row(
                    children: [
                      MyText(text: pick_date, size: 12, bgcolor: "#FFFFFF", borderRadius: 0),
                      const SizedBox(width: 135,),
                      Image.asset("assets/images/icons8-date-50(1).png", height: 20, width: 20,)
                    ]
                  ),
                ),
              )
            ),
            const SizedBox(height: 20),
            Container( 
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: getColorFromHex("#000000"),
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  color: getColorFromHex("#FFFFFF"),
                  child: Row(
                    children: [
                      MyText(text: pick_location, size: 12, bgcolor: "#FFFFFF", borderRadius: 0),
                      const SizedBox(width: 112,),
                      Image.asset("assets/images/icons8-location-50(1).png", height: 20, width: 20,)
                    ]
                  ),
                ),
              )
            ),
             const SizedBox(height: 50),
            MyText(text: "Drop Information", size: 20, bgcolor: "#FFFFFF", borderRadius: 0),
            const SizedBox(height: 20),
            Container( 
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: getColorFromHex("#000000"),
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  color: getColorFromHex("#FFFFFF"),
                  child: Row(
                    children: [
                      MyText(text: drop_date, size: 12, bgcolor: "#FFFFFF", borderRadius: 0),
                      const SizedBox(width: 135,),
                      Image.asset("assets/images/icons8-date-50(1).png", height: 20, width: 20,)
                    ]
                  ),
                ),
              )
            ),
            const SizedBox(height: 20),
            Container( 
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: getColorFromHex("#000000"),
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  color: getColorFromHex("#FFFFFF"),
                  child: Row(
                    children: [
                      MyText(text: drop_location, size: 12, bgcolor: "#FFFFFF", borderRadius: 0),
                      const SizedBox(width: 112,),
                      Image.asset("assets/images/icons8-location-50(1).png", height: 20, width: 20,)
                    ]
                  ),
                ),
              )
            ),
            const SizedBox(height: 30),
            MyButton(
              text: "Done", 
              bgcolor: "#165214", 
              width: 250,
              height: 50,
              borderRadius: 5, 
              fgcolor: "#ffffff", 
              fontSize: 16, 
              onPressed: done
            )
          ],
        ),
      ),
    );
  }
}
