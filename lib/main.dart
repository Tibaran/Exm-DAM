import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
// Modelo para el listado del menu
import 'package:lab12_dam/menu_data_model.dart';
// Pantallas
import 'package:lab12_dam/vistas/alertas.dart';
import 'package:lab12_dam/vistas/animado.dart';
import 'package:lab12_dam/vistas/avatars.dart';
import 'package:lab12_dam/vistas/inputs.dart';
import 'package:lab12_dam/vistas/listas.dart';
import 'package:lab12_dam/vistas/slider.dart';
import 'package:lab12_dam/vistas/tarjetas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Menu',
      home: const HomePage(),
      // Controlador de rutas
      routes: <String, WidgetBuilder>{
        '/alertas': (BuildContext context) => const AlertasWidget(),
        '/avatars': (BuildContext context) => const AvatarsWidget(),
        '/tarjetas': (BuildContext context) => const TarjetasWidget(),
        '/animado': (BuildContext context) => const AnimadoWidget(),
        '/inputs': (BuildContext context) => const InputsWidget(),
        '/slider': (BuildContext context) => const SliderWidget(),
        '/listas': (BuildContext context) => const ListaWidget(),
      },
    );
  }
}

// Constructor del menu
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
// Widget del menu
class _HomePageState extends State<HomePage> {

  // Atrapar contenido del archivo json local
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
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: (){
                        Navigator.pushNamed(
                          context,
                          items[index].route.toString(),
                        );
                      },
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