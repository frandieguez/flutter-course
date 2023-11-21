import 'package:codigos_postales/models/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  var data = '';
  Place? place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment
                .center, //Center Column contents horizontally,
            children: [
              TextField(
                maxLines: 1,
                style: const TextStyle(fontSize: 17),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search,
                      color: Theme.of(context).iconTheme.color),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search',
                ),
                textAlign: TextAlign.center,
                onSubmitted: (text) async {
                  debugPrint('obteniendo datos');
                  data = 'Obteniendo datos...';

                  setState(() {});
                  try {
                    var response = await http
                        .get(Uri.parse('https://api.zippopotam.us/es/$text'));
                    debugPrint(response.body);

                    if (response.statusCode == 200) {
                      debugPrint(response.body)
                      final newPlace = placeFromJson(response.body);
                      place = newPlace as Place?;
                    } else {
                      place = null;
                    }

                    setState(() {});
                  } catch (error) {
                    debugPrint(error.toString());
                  }
                },
              ),
              if (place == null) const Text('no hay datos'),
              if (place != null) Column(children: [Text(place!.placeName)]),
              // Mostrar comunidad
              // Mostra lat lng con un icono
            ]));
  }
}
