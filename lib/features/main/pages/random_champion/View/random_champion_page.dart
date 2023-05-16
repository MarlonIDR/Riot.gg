import 'package:flutter/material.dart';

class RandomChampionPage extends StatefulWidget {
  const RandomChampionPage({Key? key}) : super(key: key);

  @override
  State<RandomChampionPage> createState() => _RandomChampionPageState();
}

class _RandomChampionPageState extends State<RandomChampionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/imagens/Aatrox.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('nome do campeão vira aqui'),
            const SizedBox(height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Aleatorio'),
            ),
          ],
        ),
      ),
    );
  }
}
