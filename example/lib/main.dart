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
                final bbc = await tatum.bnbBeaconChain.generateWallet();
                bbc.

                // print(data.toJson());
                // print(data2.toJson());
              },
              child: const Text('Test'))
        ]),
      ),
    );
  }
}
