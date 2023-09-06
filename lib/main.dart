import 'package:flutter/material.dart';
import 'package:local_store/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splashscreen_page.dart';

// import 'package:flutter/S';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Local Storage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool? newLaunch = false;

  void loadCounter() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = pref.getInt('counter')!;
    });
  }
  void _loadNewLaunch() async {
    var prefe = await SharedPreferences.getInstance();
    newLaunch = (prefe.getBool('newLaunch')) ?? true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCounter();
    _loadNewLaunch();
  }

  void _incrementCounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _counter = (pref.getInt('counter') ?? 0) + 1;
      _counter = _counter + 1;
      pref.setInt('counter', _counter);
      print('counter $_counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: newLaunch! ? const SplashScreen() : const ProfileScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
