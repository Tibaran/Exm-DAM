import 'package:flutter/material.dart';
class AnimadoWidget extends StatefulWidget {
  const AnimadoWidget({Key? key}) : super(key: key);

  @override
  State<AnimadoWidget> createState() => _AnimadoWidgetState();
}
class _AnimadoWidgetState extends State<AnimadoWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Animated')
      ),
      body: GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 75),
        ),
      ),
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

