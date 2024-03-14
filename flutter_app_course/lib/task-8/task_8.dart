import 'package:flutter/material.dart';

class NewIncrement extends StatefulWidget {
  const NewIncrement({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NewIncrement> createState() => _NewIncrementState();
}

class _NewIncrementState extends State<NewIncrement> {
  int _counter = 0;
  int _counterPlus = 0;
  int _counterMinus = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counterPlus++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counterMinus++;
      if (_counter > 0) {
        _counter--;
      } else {
        showSnackBar('Не может быть меньше 0');
      }
    });
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'You have pushed - $_counterMinus times:',
            ),
            Text(
              'You have pushed + $_counterPlus times:',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
