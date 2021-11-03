import 'package:flutter/material.dart';
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
class ListaWidget extends StatelessWidget {
  const ListaWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista')
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: const Icon(Icons.home, color: Colors.white),
        backgroundColor: Colors.blue,
      ),
    );
  }
}


