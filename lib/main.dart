import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
      debugShowCheckedModeBanner: false,
      home: const RiveScreen(),
    );
  }
}

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  late StateMachineController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 31 / 25,
                child: RiveAnimation.asset(
                  'assets/notif.riv',
                  artboard: 'Notif',
                  onInit: (Artboard artboard) {
                    _controller = StateMachineController.fromArtboard(
                        artboard, 'Animation')!;
                    artboard.addController(_controller);
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    SMIBool toggle =
                        _controller.findInput<bool>('Notif') as SMIBool;
                    toggle.value = !toggle.value;
                  },
                  child: const Text('Toggle animation'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
