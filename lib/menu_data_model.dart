// Modelo para los menus, ofrece un facil almacenaje de cada opcion
class MenuDataModel{
  int? icono;
  String? titulo;
  bool? direccion;
  String? route;

  MenuDataModel(this.icono, this.titulo, this.direccion, this.route);

  MenuDataModel.fromJson(Map<String, dynamic> json){
    icono = json['icono'];
    titulo = json['titulo'];
    direccion = json['direccion'];
    route = json['route'];
  }
}