import 'package:flutter/material.dart';
import 'package:pickanddrop/utils/util.dart';
import 'models/place.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Location extends HookConsumerWidget {
  TextEditingController search = TextEditingController();
  final List<Place> places;
  final Function(String, String) onPressed;
  final String flag;

  Location({super.key, required this.places, required this.onPressed, required this.flag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cities = useState(getCity(places));
    List<String> cities2 = cities.value;

    return Scaffold(
      appBar: AppBar(title: const Text("Pick a Location")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(  
              controller: search,  
              decoration: const InputDecoration(  
                border: OutlineInputBorder(),  
                labelText: 'Place',  
                hintText: 'Search place..',  
              ), 
              onChanged: (query) {
                List<String> result = [];
                if(query.isEmpty){
                  cities.value = getCity(places);
                }else {
                  for(var place in cities2) {
                    if(place.toLowerCase().contains(query.toLowerCase())){
                      result.add(place);
                    }
                  }
                  cities.value = result;
                }
              }, 
            ),
          ),  
          Expanded(
            child: cities2.isEmpty ? 
              const Text("No data found :(")
             : 
              ListView.builder(
                itemCount: cities2.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.location_on),
                      title: GestureDetector(
                        onTap: () {
                          onPressed(cities2[index], flag);

                        },
                        child: Text(cities2[index])
                      ),
                  );
                }
              ),
          ),
        ]
      ),
    );
  }
}
