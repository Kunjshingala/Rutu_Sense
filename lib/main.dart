import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rutu_sense/bloc/weather_bloc_bloc.dart';
import 'package:rutu_sense/screens/home_screen.dart';

import 'services/location.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: determinePosition(),
        builder: (context, snap) {
          if (snap.hasData) {
            return BlocProvider<WeatherBlocBloc>(
              create: (context) =>
                  WeatherBlocBloc()..add(FetchWeather(snap.data as Position)),
              child: const HomeScreen(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.deepPurple,
                      backgroundColor: Color(0xFFFFAB40),
                    ),
                    Text('${snap.error}'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
