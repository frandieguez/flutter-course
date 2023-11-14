import 'package:flutter/material.dart';

const primarycolor = Colors.deepPurple;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter app'),
        backgroundColor: primarycolor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.network(
              "https://media.revistavanityfair.es/photos/60e84a97a5768ac18af685dd/master/w_1280,c_limit/39710.jpg",
              width: imageWidth / 2),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star_border_outlined),
                      Icon(Icons.star_border_outlined),
                    ],
                  ),
                  Text("89 reviews",
                      style: TextStyle(fontSize: 20, color: Colors.black26))
                ]),
          ),
          const Text(
            'Harry Potter',
            style:
                TextStyle(color: primarycolor, letterSpacing: .5, fontSize: 50),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Icon(Icons.fitness_center, size: 50),
                    Text("Strength")
                  ]),
                  Column(children: [
                    Icon(Icons.auto_fix_normal, size: 51),
                    Text("Magic")
                  ]),
                  Column(children: [Icon(Icons.speed, size: 50), Text("Speed")])
                ]),
          )
        ]),
      ),
    );
  }
}
