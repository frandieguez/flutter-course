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
    fetchDeviceLocation();
  }

  Future<void> fetchDeviceLocation() async {
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
      fetchData(location!);
    }
  }

  Future<void> fetchData(Location location) async {
    try {
      final url = Uri.parse(
          "https://www.7timer.info/bin/civil.php?lon=${location.lon}&lat=${location.lat}&ac=0&unit=metric&output=json");
      var response = await http.get(url);

      setState(() {
        prediction = predictionFromJson(response.body);
      });
    } catch (error) {
      debugPrintStack();
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
      body: prediction != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (var dataserie in prediction!.dataseries)
                      DataserieRow(dataserie: dataserie),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
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
