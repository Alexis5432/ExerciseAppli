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
  int _indexLapin = Random().nextInt(4);

  int _flops = 0;
  int _pafs = 0;

void gererTape(int index){
  print('Bouton' + index.toString());

  if(this._indexLapin == index){
    this._pafs++;
    _indexLapin = Random().nextInt(4);
  }else {
    this._flops++;
  }
  setState(() {
  });
}

  @override
  Widget build(BuildContext context) {
    print(this._indexLapin);
    var b0 = MaterialButton(
        onPressed: () {
          gererTape(0);
        },
        child: Text(this._indexLapin == 0 ? 'Lapin' : 'Taupe'),
    );
    var b1 = MaterialButton(
        onPressed: () {
         gererTape(1);
        },
        child: Text(this._indexLapin == 1 ? 'Lapin' : 'Taupe'),
    );
    var b2 = MaterialButton(
        onPressed: () {
          gererTape(2);

        },
        child: Text(this._indexLapin == 2 ? 'Lapin' : 'Taupe'),
    );
    var b3 = MaterialButton(
        onPressed: () {
          gererTape(3);
        },
        child: Text(this._indexLapin == 3 ? 'Lapin' : 'Taupe'),
    );
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Tape le lapin'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Pafs: ' + this._pafs.toString(),
                   style: TextStyle(color: Colors.green, fontSize: 20),
    ),

                  Text('Flops: ' + this._flops.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 20),
    )
                ],
            ),
            const Text(
                'Tape le lapin' ,
              style: TextStyle( fontSize: 40, fontWeight: FontWeight.w900 ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,

             children: [
               b0,

               b1
             ],
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
               b2,
                b3
              ],
            )
          ],
        ),
      ),
    );
  }
}
