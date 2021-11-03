import 'package:flutter/material.dart';
class InputsWidget extends StatefulWidget {
  const InputsWidget({Key? key}) : super(key: key);

  @override
  State<InputsWidget> createState() => _InputsWidgetState();
}
class _InputsWidgetState extends State<InputsWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs')
      ),
      body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
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

