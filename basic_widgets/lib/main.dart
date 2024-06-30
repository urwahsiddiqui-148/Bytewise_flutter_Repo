import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_alarm_outlined),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20.0,
                                right: 270.34,
                                left: 20.0,
                                bottom: 20.0),
                            color: Colors.amber[600],
                            width: 100.0,
                            height: 120.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Action to perform when button is pressed
                              debugPrint(' you pressed ElevatedButton');

                              // Show a Snackbar as feedback
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Button Pressed!'),
                                ),
                              );
                            },
                            child: const Text('Press Me'),
                          ),
                          // Added the image wrapped with Flexible
                          const Flexible(
                            child: Image(
                              image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: const Column(
        children: <Widget>[
          Text('This is first line in the column widget'),
          Text('This is second line in the column widget'),
          Expanded(
            child: FittedBox(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
