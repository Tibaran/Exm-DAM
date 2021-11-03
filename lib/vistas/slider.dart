import 'package:flutter/material.dart';
class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  // Slider value
  double _currentSliderValue = 20;
  // Chebox value
  bool isChecked = false;
  // Chekbox method
  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider y CheckBox')
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ],
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
  