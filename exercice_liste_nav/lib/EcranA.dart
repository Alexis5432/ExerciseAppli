import 'package:flutter/material.dart';


class EcranA extends StatefulWidget {

  final String leTruc;

  const EcranA({Key? key, required this.leTruc}) : super(key: key);

  @override
  State<EcranA> createState() => _EcranAState();
}

class _EcranAState extends State<EcranA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecran A'),
      ),
      body: Text( '${widget.leTruc}'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}