import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lab12_dam/menu_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Menu',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Fetch content from the json file
  Future<List<MenuDataModel>> readJson() async {
    final response = await rootBundle.loadString('assets/menuList.json');
    final data = await json.decode(response) as List<dynamic>;

    return data.map((e) => MenuDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Componentes',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: FutureBuilder(
          future: readJson(),
          builder: (context, data){
            if(data.hasError){
              return Center(child: Text("${data.error}"));
            }else if(data.hasData){
              var items = data.data as List<MenuDataModel>;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index){
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                              IconData(items[index].icono!.toInt(), 
                              fontFamily: 'MaterialIcons', 
                              matchTextDirection: items[index].direccion!),
                              color: Colors.blue,
                              size: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(items[index].titulo.toString()),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.blue,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
//58705, opcional input matchTextDirection: true
//58040 , opcional lista matchTextDirection: true
// constr IconData(58174, fontFamily: 'MaterialIcons', matchTextDirection: true)