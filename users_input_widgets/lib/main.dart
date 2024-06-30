import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for KeyboardListener

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Autocomplete Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AutocompleteScreen(),
    );
  }
}

class AutocompleteScreen extends StatelessWidget {
  final List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Indian Fig',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tangerine',
    'Ugli fruit',
    'Vanilla bean',
    'Watermelon',
    'Xigua',
    'Yellow passion fruit',
    'Zucchini',
  ];

  AutocompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('This is the implementation of\nauto complete widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: KeyboardListenerExample(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Type a fruit name:',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return suggestions.where((String option) {
                    return option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  debugPrint('You selected: $selection');
                },
              ),
              const SizedBox(height: 20),
              const EmailForm(), // Integrated Form widget
            ],
          ),
        ),
      ),
    );
  }
}

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      debugPrint('Email submitted: $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Enter your email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class KeyboardListenerExample extends StatelessWidget {
  final Widget child;

  const KeyboardListenerExample({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      // ignore: deprecated_member_use
      onKey: (FocusNode node, RawKeyEvent event) {
        // ignore: deprecated_member_use
        if (event is RawKeyDownEvent) {
          final key = event.logicalKey;
          if (key == LogicalKeyboardKey.enter) {
            debugPrint('Enter key pressed');
          } else if (key == LogicalKeyboardKey.escape) {
            debugPrint('Escape key pressed');
          } else {
            debugPrint('Key pressed: ${key.debugName}');
          }
        }
        return KeyEventResult.ignored;
      },
      child: child,
    );
  }
}
