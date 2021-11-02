class MenuDataModel{
  int? icono;
  String? titulo;
  bool? direccion;

  MenuDataModel(this.icono, this.titulo, this.direccion);

  MenuDataModel.fromJson(Map<String, dynamic> json){
    icono = json['icono'];
    titulo = json['titulo'];
    direccion = json['direccion'];
  }
}