import 'package:flutter/material.dart';
class AvatarsWidget extends StatelessWidget {
  const AvatarsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatars')
      ),
      body: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
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
