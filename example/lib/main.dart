import 'package:flutter/material.dart';
import 'package:tatum/tatum.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Tatum.initArchitecture();
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

  String addr = 'noting';
  String addr2 = 'noting';

  @override
  void initState() {
    super.initState();
    tatum.setKey('enter-api-key');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Flexible(child: const Text('Eth address:')),
              Text(addr),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(child: const Text('XRP address:')),
              Text(addr2),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    
                    final eth = await tatum.ethereum.generateWallet();
                    final address = await tatum.ethereum
                        .generateEthereumAccountAddressFromXPubKey(
                            xpub: eth.xpub, index: 1);
                    setState(() {
                      addr = address.address;
                    });

                    

                    // print(data.toJson());
                    // print(data2.toJson());
                  },
                  child: const Text('Test Eth')),
              ElevatedButton(
                  onPressed: () async {
                    final xrp = await tatum.ripple.generateAccount();

                    setState(() {
                      addr2 = xrp.address!;
                    });

                    // print(data.toJson());
                    // print(data2.toJson());
                  },
                  child: const Text('Test Ripple')),
            ],
          )
        ]),
      ),
    );
  }
}
