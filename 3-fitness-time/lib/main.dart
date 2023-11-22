import 'package:fitness_time/data/activities.dart';
import 'package:fitness_time/screens/activity_details_screen.dart';
import 'package:fitness_time/screens/activity_list_screen.dart';
import 'package:fitness_time/screens/add_activity_screen.dart';
import 'package:fitness_time/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'data/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Activities()),
        ChangeNotifierProvider(create: (_) => Profile()),
      ],
      child: MaterialApp(
        title: 'Fitness time',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.lato().fontFamily,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.purple.shade400,
                foregroundColor: Colors.white)),
        initialRoute: '/',
        routes: {
          '/': (context) => ActivityListScreen(),
          '/add': (context) => AddActivityScreen(),
          '/profile/me': (context) => ProfileScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/details') {
            // If the route is for the details screen, extract the activity argument
            final args = settings.arguments as Map<String, dynamic>;
            final id = args['id'] as int;

            return MaterialPageRoute(
              builder: (context) => ActivityDetailsScreen(id: id),
            );
          }

          return null;
        },
      ),
    );
  }
}
