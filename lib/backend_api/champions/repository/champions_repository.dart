import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:riotgg/backend_api/champions/repository/i_champions_repository.dart';
import 'package:riotgg/mysqlconnection/database_dart.dart';
import 'package:riotgg/shared/exceptions/database_exception.dart';
import 'package:riotgg/shared/models/champion_model.dart';

class ChampionsRepository implements IChampionsRepository {
  @override
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

  @override
  Future<List<ChampionModel>> getChampions() async {
    List<ChampionModel> listaChampions = [];

    MySqlConnection? conn;

    try {
      conn = await DatabaseDart.instance.getConnection();

      final myResults = await conn.query('SELECT * FROM `riot_gg`.champions ORDER BY nome');
      for (var row in myResults) {
        listaChampions.add(
          ChampionModel(
            nome: row['nome'],
            url: row['url'],
            lane: row['lane'],
          ),
        );
      }
      return listaChampions;
    } on MySqlException catch (e) {
      debugPrint(e.message);
      throw DatabaseException(
          message: 'Erro ao puxar Campeoes do banco de dados!');
    }
  }
  Future<List<ChampionModel>> getChampionsTop() async {
    List<ChampionModel> listaChampions = [];
    
    MySqlConnection? conn;

    try{
      conn = await DatabaseDart.instance.getConnection();

      final myResults = await conn.query('SELECT * FROM `riot_gg`.champions WHERE lane = (?)', ['top']);
      for (var row in myResults){
        listaChampions.add(ChampionModel(nome: row['nome'], url: row['url'], lane: row['lane']),);
      }
      return listaChampions;
    } on MySqlException catch (e){
      debugPrint(e.message);
      throw DatabaseException(message: 'Erro ao achar campeoes da top lane');
    }
  }
  Future<List<ChampionModel>> getChampionsJg() async {
    List<ChampionModel> listaChampions = [];
    
    MySqlConnection? conn;

    try{
      conn = await DatabaseDart.instance.getConnection();

      final myResults = await conn.query('SELECT * FROM `riot_gg`.champions WHERE lane = (?)', ['jg']);
      for (var row in myResults){
        listaChampions.add(ChampionModel(nome: row['nome'], url: row['url'], lane: row['lane']),);
      }
      return listaChampions;
    } on MySqlException catch (e){
      debugPrint(e.message);
      throw DatabaseException(message: 'Erro ao achar campeoes da jg lane');
    }
  }
  Future<List<ChampionModel>> getChampionsMid() async {
    List<ChampionModel> listaChampions = [];
    
    MySqlConnection? conn;

    try{
      conn = await DatabaseDart.instance.getConnection();

      final myResults = await conn.query('SELECT * FROM `riot_gg`.champions WHERE lane = (?)', ['mid']);
      for (var row in myResults){
        listaChampions.add(ChampionModel(nome: row['nome'], url: row['url'], lane: row['lane']),);
      }
      return listaChampions;
    } on MySqlException catch (e){
      debugPrint(e.message);
      throw DatabaseException(message: 'Erro ao achar campeoes da mid lane');
    }
  }
  Future<List<ChampionModel>> getChampionsAdc() async {
    List<ChampionModel> listaChampions = [];
    
    MySqlConnection? conn;

    try{
      conn = await DatabaseDart.instance.getConnection();

      final myResults = await conn.query('SELECT * FROM `riot_gg`.champions WHERE lane = (?)', ['adc']);
      for (var row in myResults){
        listaChampions.add(ChampionModel(nome: row['nome'], url: row['url'], lane: row['lane']),);
      }
      return listaChampions;
    } on MySqlException catch (e){
      debugPrint(e.message);
      throw DatabaseException(message: 'Erro ao achar campeoes da adc lane');
    }
  }
  Future<List<ChampionModel>> getChampionsSup() async {
    List<ChampionModel> listaChampions = [];
    
    MySqlConnection? conn;

    try{
      conn = await DatabaseDart.instance.getConnection();

      final myResults = await conn.query('SELECT * FROM `riot_gg`.champions WHERE lane = (?)', ['sup']);
      for (var row in myResults){
        listaChampions.add(ChampionModel(nome: row['nome'], url: row['url'], lane: row['lane']),);
      }
      return listaChampions;
    } on MySqlException catch (e){
      debugPrint(e.message);
      throw DatabaseException(message: 'Erro ao achar campeoes da sup lane');
    }
  }
}
