import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var numberDice = 1;
  Random random = Random();

  void _rolledDice() {
    setState(() {
      numberDice = random.nextInt(6) + 1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Dice Rolled'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Dado App'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/dice_$numberDice.png',
                width: 170,
              ),
              Text(
                'Numero del dado: $numberDice',
                style: const TextStyle(fontSize: 25),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Colors.lightBlueAccent,
                )),
                onPressed: _rolledDice,
                icon: const Icon(Icons.refresh),
                label: const Text('Roll'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
