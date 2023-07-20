import 'package:flutter/material.dart';
import 'package:pickanddrop/utils/util.dart';
import 'components/text.dart';
import 'components/button.dart';
import 'models/place.dart';

class Location extends StatelessWidget {
  final List<Place> places;

  Location({super.key, required this.places});

  String dropdownValue = "Ethiopia";
  late String dropdownValue2;
  var items = ["Ethiopia", "Kenya", "Dijbouti", "Sudan"];

  @override
  Widget build(BuildContext context) {
    var cities = getCity(places);
    dropdownValue2 = cities.first;
    print(cities);
    return Center(
        child: Column(
      children: [
        Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: getColorFromHex("#000000"),
                ),
                borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
              ),
              child: Container(
                color: getColorFromHex("#FFFFFF"),
                child: Row(children: [
                  MyText(
                      text: "Country",
                      size: 12,
                      bgcolor: "#FFFFFF",
                      borderRadius: 0),
                  const SizedBox(
                    width: 90,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward_rounded),
                    elevation: 16,
                    onChanged: (String? value) {
                      dropdownValue = value!;
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ]),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: getColorFromHex("#000000"),
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child:  Container(
                          color: getColorFromHex("#FFFFFF"),
                          child: Row(children: [
                            MyText(
                                text: "City",
                                size: 12,
                                bgcolor: "#FFFFFF",
                                borderRadius: 0),
                            const SizedBox(
                              width: 110,
                            ),
                            DropdownButton<String>(
                              value: dropdownValue2,
                              icon: const Icon(Icons.arrow_downward_rounded),
                              elevation: 16,
                              onChanged: (String? value) {
                                dropdownValue = value!;
                              },
                              items: cities
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ]),
                        ))),
        const SizedBox(
          height: 20,
        ),
        MyButton(
            text: "Pick",
            width: 250,
            height: 50,
            bgcolor: "#165214",
            borderRadius: 5,
            fgcolor: "#ffffff",
            fontSize: 14,
            onPressed: () {}),
      ],
    ));
  }
}
