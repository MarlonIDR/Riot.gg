import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riotgg/features/main/pages/random_champion/View/random_champion_state.dart';
import 'package:riotgg/features/main/pages/random_champion/controller/random_champion_controller.dart';

class RandomChampionPage extends StatefulWidget {
  const RandomChampionPage({Key? key}) : super(key: key);

  @override
  State<RandomChampionPage> createState() => _RandomChampionPageState();
}

class _RandomChampionPageState extends State<RandomChampionPage> {
  // RandomChampionController? _championController;
  // @override
  // void initState() {

  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _championController = context.read<RandomChampionController>();
  //   });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomChampionController, RandomChampionState>(
      builder: (context, state) {
        final _championController = context.read<RandomChampionController>();
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: BlocBuilder<RandomChampionController,
                      RandomChampionState>(
                    builder: (context, state) {
                      return Image.asset(
                        _championController.state.championModel != null
                            ? _championController.state.championModel!.url
                            : 'assets/imagens/padrão.png',
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<RandomChampionController, RandomChampionState>(
                  builder: (context, state) {
                    return Text(_championController.state.championModel != null
                        ? _championController.state.championModel!.nome
                        : 'Nome campeão');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<RandomChampionController, RandomChampionState>(
                  builder: (context, state) {
                    return Text(_championController.state.randomLane != null
                        ? _championController.state.randomLane!
                        : "Lane para jogar");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<RandomChampionController, RandomChampionState>(
                  builder: (context, state) {
                    if (state.status == RandomChampionStatus.loading) {
                      return const SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    } else {
                      return ElevatedButton(
                        onPressed: () {
                          _championController.buscaAleatoriaChampion();
                        },
                        child: const Text('Aleatorio'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
