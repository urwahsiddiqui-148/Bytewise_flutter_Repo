import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Widgets Example',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const LayoutWidgetsScreen(),
    );
  }
}

class LayoutWidgetsScreen extends StatelessWidget {
  const LayoutWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Sliver Layout'),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Single-child Layout Widget Example
                  Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Center(
                      child: Text(
                        'This is a Container widget with Center',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  // Multiple-child Layout Widget Example
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                        child: const Center(child: Text('1')),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                        child: const Center(child: Text('2')),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                        child: const Center(child: Text('3')),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.black,
                          child: const Center(
                              child: Text(
                            'Stack',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Sliver List Widget Example
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      '${index + 1}>> list Item(scrollable)',
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                childCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
