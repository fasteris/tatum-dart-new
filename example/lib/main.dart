import 'package:flutter/material.dart';
import 'package:tatum/tatum.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Tatum.config();
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
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tatum = Tatum.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tatum.setKey('f7c45865-5e5a-4fad-886b-bde72d89b7ce');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () async {
                // final data = await tatum.elrond.;
                // print(data);
              },
              child: Text('Test'))
        ]),
      ),
    );
  }
}
