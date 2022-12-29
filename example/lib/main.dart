import 'package:flutter/material.dart';
import 'package:tatum/tatum.dart';
import 'package:universal_html/controller.dart';

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
    // test();
  }

  void test() async {
    final controller = WindowController();
    await controller.openHttp(
      uri: Uri.parse("https://coincodex.com/convert/bitcoin/tether"),
    );

    // Select the top story using a CSS query
    final topStoryTitle =
        controller.window!.document.querySelectorAll(".rate").first.text;

    final moneyside = topStoryTitle!.split("=");
    final value = moneyside.last.trim().split(" ").first.trim();

    // Print result
    print(value.toString());
  }

  Future<double> convert(
      {required String from, required String to, required int amount}) async {
    final controller = WindowController();
    await controller.openHttp(
      uri: Uri.parse("https://coincodex.com/convert/$from/$to"),
    );

    // Select the top story using a CSS query
    try {
      final topStoryTitle =
          controller.window!.document.querySelectorAll(".rate").first.text;

      final moneyside = topStoryTitle!.split("=");
      final value = moneyside.last.trim().split(" ").first.trim();

      // Print result
      print(value);
      var result = double.parse(value.toString().replaceAll(',', '')) * amount;
      return result;
    } catch (e, stacktrace) {
      print("$e: $stacktrace");
      return 0;
    }

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
                    // final eth = await tatum.ethereum.generateWallet();
                    // final address = await tatum.ethereum
                    //     .generateEthereumAccountAddressFromXPubKey(
                    //         xpub: eth.xpub, index: 1);
                    // setState(() {
                    //   addr = address.address;
                    // });

                    // print(data.toJson());
                    // print(data2.toJson());
                    final con = await convert(
                        from: 'tether', to: 'bitcoin', amount: 400);
                    print(con);
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
