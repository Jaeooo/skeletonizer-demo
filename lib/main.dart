import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _setLoading();
  }

  void _setLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final users = _loading
        ? List.generate(
            10,
            (idx) =>
                {'title': 'Hello, World', 'description': 'Nice to Meet You'})
        : List.generate(
            12,
            (idx) =>
                {'title': 'Hello, World', 'description': 'Nice to Meet You'});

    return Skeletonizer(
      enabled: _loading,
      containersColor: Colors.white,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ct x, idx) => Card(
          color: Colors.yellow,
          child: ListTile(
            title: Text(users[idx]['title']!),
            subtitle: Text(users[idx]['description']!),
            trailing: const Icon(Icons.handshake),
          ),
        ),
      ),
    );
  }
}
