import 'package:flutter/material.dart';

// custom widgets
import 'package:pickanddrop/components/button.dart';
import 'package:pickanddrop/components/text.dart';
import 'package:pickanddrop/screens/checkout.dart';
import 'screens/location.dart';
import 'screens/date.dart';

// utilities
import 'package:pickanddrop/utils/util.dart';
import 'package:pickanddrop/models/place.dart';

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: getColorFromHex("#165214")),
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
  List<Place> places = [];

  void pickDate(date, flag) {
    setState(() {
      if(flag == "pick"){
        pick_date = date;
      }else {
        drop_date = date;
      }
    });
  }

  void pickLocation(location, flag) {
    setState(() {
      if(flag == "pick"){
        pick_location = location;
      }else {
        drop_location = location;
      }
    });
  }

  Future fetchData() async {
    setState(() async {
      places = await fetchPlaces();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColorFromHex("#165214"),
        title: MyText(
          text: widget.title,
          bgcolor: "#165214",
          fgcolor: "#FFFFFF",
          borderRadius: 0,
          size: 18,
          isBold: true,
        ),
        centerTitle: true,
      ),
      backgroundColor: getColorFromHex("#FFFFFF"),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              child: MyText(
                  text: "PickUp Information",
                  size: 20,
                  bgcolor: "#FFFFFF",
                  borderRadius: 0),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Date(flag: "pick" ,onPressed: (date, flag) => pickDate(date, flag),)),
                )
              },
              child: Container(
                  width: 250,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: getColorFromHex("#000000"),
                      ),
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      color: getColorFromHex("#FFFFFF"),
                      child: Row(children: [
                        Expanded(
                          child: MyText(
                              text: pick_date,
                              size: 12,
                              bgcolor: "#FFFFFF",
                              borderRadius: 0),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Image.asset(
                          "assets/images/icons8-date-50(1).png",
                          height: 20,
                          width: 20,
                        )
                      ]),
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Location(
                      places: places, 
                      onPressed: (location, flag) => pickLocation(location, flag),
                      flag: "pick",
                    )
                  ),
               );
              },
              child: Container(
                  width: 250,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
                      child: Row(children: [
                        Expanded(
                          child: MyText(
                              text: pick_location,
                              size: 12,
                              bgcolor: "#FFFFFF",
                              borderRadius: 0),
                        ),
                        const SizedBox(
                          width: 112,
                        ),
                        Image.asset(
                          "assets/images/icons8-location-50(1).png",
                          height: 20,
                          width: 20,
                        )
                      ]),
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MyText(
                  text: "Drop Information",
                  size: 20,
                  bgcolor: "#FFFFFF",
                  borderRadius: 0),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Date(flag: "drop",onPressed: (date, flag) => pickDate(date, flag),)),
                )
              },
              child: Container(
                  width: 250,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
                      child: Row(children: [
                        Expanded(
                          child: MyText(
                              text: drop_date,
                              size: 12,
                              bgcolor: "#FFFFFF",
                              borderRadius: 0),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        Image.asset(
                          "assets/images/icons8-date-50(1).png",
                          height: 20,
                          width: 20,
                        )
                      ]),
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            GestureDetector(
               onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Location(
                      places: places, 
                      onPressed: (location, flag) => pickLocation(location, flag),
                      flag: "drop",
                    )
                  ),
               );
              },
              child: Container(
                  width: 250,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
                      child: Row(children: [
                        Expanded(
                          child: MyText(
                              text: drop_location,
                              size: 12,
                              bgcolor: "#FFFFFF",
                              borderRadius: 0
                          ),
                        ),
                        const SizedBox(
                          width: 112,
                        ),
                        Image.asset(
                          "assets/images/icons8-location-50(1).png",
                          height: 20,
                          width: 20,
                        )
                      ]),
                    ),
                  )),
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
                onPressed: () {
                  if(pick_date == "Pick Date" || drop_date == "Drop Date"){
                     showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                              scrollable: true,
                              title: Text("Error"),
                              content: Text("Please pick date!!")
                          );
                        }
                     ); 
                  }else if(pick_location == "Pick Location" || drop_location == "Drop Location"){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                              scrollable: true,
                              title: Text("Error"),
                              content: Text("Please pick location!!")
                          );
                        }
                     ); 
                  }else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOut(
                          pick_date: pick_date,
                          drop_date: drop_date,
                          pick_location: pick_location,
                          drop_location: drop_location,
                        ),
                      )
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
