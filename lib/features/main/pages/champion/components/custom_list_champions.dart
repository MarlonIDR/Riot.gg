import 'package:flutter/material.dart';
import 'package:riotgg/shared/models/champion_model.dart';

class ChampionListItem extends StatelessWidget {
  final ChampionModel champion;

  const ChampionListItem({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        champion.url,
        width: 50,
        height: 50,
      ),
      title: Text(champion.nome),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text('Winrate: 75%'), // Substitua pelo valor real de winrate
          Text('Pickrate: 12%'), // Substitua pelo valor real de pickrate
          Text('Banrate: 5%'), // Substitua pelo valor real de banrate
        ],
      ),
    );
  }
}
