import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riotgg/shared/exceptions/database_exception.dart';

class DatabaseDart {
  DatabaseDart._privateConstructor();

  static final DatabaseDart _instance = DatabaseDart._privateConstructor();

  static DatabaseDart get instance => _instance;

  static const _myHost =
      'db-riot-gg.cyrpmhdmh2as.us-east-2.rds.amazonaws.com'; //<- alterar para o novo endpoint
  static const _myPort = 3306;
  static const _myUser = 'root';
  static const _myPassword = '15161718';
  late MySqlConnection connection;

  Future<MySqlConnection> openConnection(String schema) async {
    final settings = ConnectionSettings(
      host: _myHost,
      port: _myPort,
      user: _myUser,
      password: _myPassword,
      db: schema,
    );

    var possuiInternet = await InternetConnectionChecker().hasConnection;

    if (possuiInternet) {
      try {
        connection = await MySqlConnection.connect(settings);
      } on MySqlException catch (e) {
        debugPrint(e.message);
        throw DatabaseException(
            message: 'Erro ao se conectar ao banco de dados.');
      }
      try {
        closeConnection(connection);
      } catch (e) {
        DatabaseException(message: 'Houve um erro com conexão de internet');
      }
    }
    return connection;
  }

  void closeConnection(MySqlConnection connection) {
    connection.close();
    debugPrint('connectionClosed');
  }

  Future<MySqlConnection> getConnection() async {
    final settings = ConnectionSettings(
        host: _myHost,
        port: _myPort,
        user: _myUser,
        password: _myPassword,
        db: 'riot_gg');

    var connection = await MySqlConnection.connect(
      ConnectionSettings(
        host: settings.host,
        port: settings.port,
        user: settings.user,
        password: settings.password,
        db: settings.db,
      ),
    );
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    return connection;
  }
}
