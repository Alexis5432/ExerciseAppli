import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  final List <String> nom = [ "Alice", "Bruno", "Claire", "David", "Emma", "Félix", "Georges"];

  List<String> listnoms = [];

  void mix(){
    Random random = Random();
    final nomsMelanges = List<String>.from(nom)..shuffle(random);
    setState(() {
      listnoms = nomsMelanges.take(5).toList();
    });
}

  void monter(int index) {
    if (index > 0) {
      setState(() {
        final tmp = listnoms[index];
        listnoms[index] = listnoms[index - 1];
        listnoms[index - 1] = tmp;
      });
      verifierOrdre();
    }
  }

  void descendre(int index) {
    if (index < listnoms.length - 1) {
      setState(() {
        final tmp = listnoms[index];
        listnoms[index] = listnoms[index + 1];
        listnoms[index + 1] = tmp;
      });
      verifierOrdre();
    }
  }
  void verifierOrdre() {
    final nomsTries = List<String>.from(listnoms)..sort();
    if (listnoms.join() == nomsTries.join()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Bravo !"),
          content: const Text("La liste est dans l'ordre alphabétique."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                mix();
              },
              child: const Text("Rejouer"),
            )
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: listnoms.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: mix,
                child: const Text('Mélanger les noms'),
              ),
            );
          }
          final nom = listnoms[index - 1];
          return ListTile(
            title: Text(nom),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () => monter(index - 1),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () => descendre(index - 1),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
