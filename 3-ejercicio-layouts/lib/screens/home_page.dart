import 'package:flutter/material.dart';

const secondaryColor = Color.fromARGB(255, 200, 125, 249);
const primaryColor = Color.fromARGB(255, 248, 150, 216);

class HomePage extends StatefulWidget {
  final Key? key;

  HomePage({this.key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double slider1Value = 0.0;
  double slider2Value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Center(child: Text('Profile', textAlign: TextAlign.center)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  "https://media.revistavanityfair.es/photos/60e84a97a5768ac18af685dd/master/w_1280,c_limit/39710.jpg",
                ),
              ),
              const Text(
                'Xurxo Carballo',
                style: TextStyle(
                    color: Colors.black54, letterSpacing: .5, fontSize: 50),
              ),
              const Text(
                'registered 20 April 2023',
                style: TextStyle(
                    color: Colors.black38, letterSpacing: .5, fontSize: 15),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColumnWithShadow(
                      children: [
                        Icon(Icons.timer, size: 50),
                        Text("Tempo"),
                        Text("2h 45'", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    _buildColumnWithShadow(
                      children: [
                        Icon(Icons.location_on, size: 51),
                        Text("km"),
                        Text("212,4", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    _buildColumnWithShadow(
                      children: [
                        Icon(Icons.speed, size: 50),
                        Text("Actividades"),
                        Text("42", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSliderRow(
                      name: 'Height',
                      value: slider1Value,
                      onChanged: (value) {
                        setState(() {
                          slider1Value = value;
                        });
                      },
                    ),
                    _buildSliderRow(
                      name: 'Weight',
                      value: slider2Value,
                      onChanged: (value) {
                        setState(() {
                          slider2Value = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderRow(
      {required String name,
      required double value,
      required ValueChanged<double> onChanged}) {
    return Row(
      children: [
        Text(
          '${name}',
          style: const TextStyle(fontSize: 16.0),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: 0.0,
            max: 100.0,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          value.toStringAsFixed(2),
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildColumnWithShadow({required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
