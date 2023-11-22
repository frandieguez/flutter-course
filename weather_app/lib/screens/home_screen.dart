import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/models/prediction.dart';

import '../models/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  late Prediction? prediction;
  late Location? location;

  @override
  void initState() {
    super.initState();
    prediction = null;
    fetchLocationAndData();
  }

  Future<Prediction> fetchLocationAndData() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      debugPrint(position.toString());
      location = Location(lat: position.latitude, lon: position.longitude);
    } catch (error) {
      // Possibly on linux the geolocator has no implementation or we dont have permissions
      location = Location(lat: 42.9, lon: -8.533333);
      // debugPrint(error.toString());
    } finally {
      return fetchData(location!);
    }
  }

  Future<Prediction> fetchData(Location location) async {
    try {
      final url = Uri.parse(
          "https://www.7timer.info/bin/civil.php?lon=${location.lon}&lat=${location.lat}&ac=0&unit=metric&output=json");
      var response = await http.get(url);

      return predictionFromJson(response.body);
    } catch (error) {
      throw Exception('Error while fetching data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder<Prediction>(
          future: fetchLocationAndData(),
          builder: (BuildContext context, snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = [
                 Column(
                      children: [
                        for (var dataserie in snapshot.data!.dataseries)
                          DataserieRow(dataserie: dataserie),
                      ],
                    ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                ),
              ];
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            prediction = null;
          });
          fetchData(location!);
        },
        child: Icon(Icons.update),
      ),
    );
  }
}

class DataserieRow extends StatelessWidget {
  final Dataserie dataserie;
  final DateFormat formattedDate = DateFormat("'Dia' d \nk:mm");

  DataserieRow({Key? key, required this.dataserie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(formattedDate.format(dataserie.timepoint),
          style: TextStyle(fontSize: 16)),
      Icon(dataserie.iconData),
      Text('${dataserie.temp2M}°C', style: TextStyle(fontSize: 16)),
    ]);
  }

  IconData getWeatherIcon(String weather) {
    // Implement logic to map weather to appropriate IconData
    // For example, you can use the WeatherIcons package or define your own mapping.
    // Replace the following line with your logic.
    return Icons.cloud; // Placeholder, replace with actual logic.
  }
}
