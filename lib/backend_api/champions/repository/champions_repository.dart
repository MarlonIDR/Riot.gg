import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:riotgg/backend_api/champions/repository/i_champions_repository.dart';
import 'package:riotgg/mysqlconnection/database_dart.dart';
import 'package:riotgg/shared/exceptions/database_exception.dart';
import 'package:riotgg/shared/models/champion_model.dart';

class ChampionsRepository implements IChampionsRepository {
  Future<ChampionModel> buscaAleatoriaChampion() async {
    MySqlConnection? conn;

    try {
      conn = await DatabaseDart.instance.getConnection();
      final results = await conn.query(
        'SELECT * FROM `riot_gg`.champions ORDER BY RAND() LIMIT 1;',
      );

      final row = results.first.fields;
      final nome = row['nome'] as String;
      final url = row['url'] as String;
      final lane = row['lane'] as String;

      return ChampionModel(nome: nome, url: url, lane: lane);
    } on MySqlConnection catch (e) {
      debugPrint(e.toString());
       throw DatabaseException(
          message: 'Erro ao buscar informações no banco de dados');
    }

  }
}
