import 'dart:async';
import 'package:flutter/material.dart';
import 'food_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Food> futureFood;

  @override
  void initState() {
    super.initState();
    futureFood = fetchFood();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Food>(
            future: futureFood,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // foodNameIterable is Iterable
                var foodNameIterable = snapshot.data?.i2790?.row
                    ?.map((futureFood) => futureFood.dESCKOR);
                // Iterable의 element 가져오는 방법
                var a = foodNameIterable?.elementAt(0);
                for (var foodName in foodNameIterable!) {
                  print(foodName);
                }

                return Text(
                    '${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.dESCKOR)}');
                // '${snapshot.data?.i2790?.row?.map((futureFood) => '${futureFood.dESCKOR}: ${futureFood.nUTRCONT1}kcal')}');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
