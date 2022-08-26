import 'dart:async';
import 'package:flutter/material.dart';
import 'food_model.dart';
import 'providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Food> futureFood;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  // If you want to have the option of reloading the API in response to an InheritedWidget changing,
  // put the call into the didChangeDependencies() method
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    futureFood = fetchFood('');
  }

  
  // Update Food List
  void updateList(String foodName) {
    print('updateList()');
    setState(() {
      futureFood = fetchFood(foodName);
    });
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
              // 음식 정보 가져오는법
              var foodIterable = snapshot.data?.i2790?.row
                  ?.map((futureFood) => futureFood.dESCKOR);
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.i2790?.row?.length,
                  itemBuilder: (context, index) {
                    // print(foodIterable?.elementAt(index));
                    return ListTile(
                      title: Text(
                          '${snapshot.data?.i2790?.row?.map((futureFood) => futureFood.dESCKOR).elementAt(index)}'),
                    );
                  },
                );
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
        bottomNavigationBar: TextField(
          // onChanged: (foodName) => updateList(foodName),
          onSubmitted: (String foodName) {
            updateList(foodName);
          },
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.0),
              ),
              hintText: "검색",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.white),
        ),
      ),
    );
  }

// }
}
