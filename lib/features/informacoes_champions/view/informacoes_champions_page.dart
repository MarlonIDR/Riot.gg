// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:riotgg/shared/models/champion_model.dart';

class InformacoesChampionsPage extends StatelessWidget {
  final ChampionModel championModel;

  const InformacoesChampionsPage({
    Key? key,
    required this.championModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            championModel.championSplashArtUrl,
                            height: screenSize.height * 0.3,
                            width: screenSize.width * 1,
                          ),
                          Positioned(
                            top: 16,
                            left: 16,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 16,
                            child: Text(
                              championModel.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 150,
                              color: Colors.grey[100],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Summoner Rift',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey[600],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                builder: (context) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      automaticallyImplyLeading: false,
                                      actions: [
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          color: Colors.black,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    body: Container(
                                      padding: const EdgeInsets.all(16),
                                      height: 300,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                  championModel.passivaUrl,
                                                  width:
                                                      screenSize.width * 0.25,
                                                  height:
                                                      screenSize.width * 0.25),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    championModel.passivaName,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(championModel
                                                      .passivaDescricao),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 30,
                              width: 30,
                              child: ClipOval(
                                child: Image.asset(
                                  championModel.passivaUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                builder: (context) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      automaticallyImplyLeading: false,
                                      actions: [
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          color: Colors.black,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    body: Container(
                                      padding: const EdgeInsets.all(16),
                                      height:
                                          300, // Defina o tamanho inicial do BottomSheet aqui
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Conteúdo do BottomSheet para habilidadeQ
                                          Row(
                                            children: [
                                              Image.asset(
                                                championModel.habilidadeQUrl,
                                                width: screenSize.width * 0.25,
                                                height: screenSize.width * 0.25,
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    championModel
                                                        .habilidadeQNome,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(championModel
                                                      .habilidadeQDescricao),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // Adicione outros widgets conforme necessário
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child:
                                      Image.asset(championModel.habilidadeQUrl),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 15,
                                  child: Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'Q',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                builder: (context) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      automaticallyImplyLeading: false,
                                      actions: [
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          color: Colors.black,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    body: Container(
                                      padding: const EdgeInsets.all(16),
                                      height:
                                          300, // Defina o tamanho inicial do BottomSheet aqui
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Conteúdo do BottomSheet para habilidadeQ
                                          Row(
                                            children: [
                                              Image.asset(
                                                championModel.habilidadeWUrl,
                                                width: screenSize.width * 0.25,
                                                height: screenSize.width * 0.25,
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    championModel
                                                        .habilidadeWNome,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(championModel
                                                      .habilidadeWDescricao),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // Adicione outros widgets conforme necessário
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child:
                                      Image.asset(championModel.habilidadeWUrl),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 15,
                                  child: Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'W',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                builder: (context) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      automaticallyImplyLeading: false,
                                      actions: [
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          color: Colors.black,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    body: Container(
                                      padding: const EdgeInsets.all(16),
                                      height:
                                          300, // Defina o tamanho inicial do BottomSheet aqui
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Conteúdo do BottomSheet para habilidadeQ
                                          Row(
                                            children: [
                                              Image.asset(
                                                championModel.habilidadeEUrl,
                                                width: screenSize.width * 0.25,
                                                height: screenSize.width * 0.25,
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    championModel
                                                        .habilidadeENome,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(championModel
                                                      .habilidadeWDescricao),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // Adicione outros widgets conforme necessário
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child:
                                      Image.asset(championModel.habilidadeEUrl),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 15,
                                  child: Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'E',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        automaticallyImplyLeading: false,
                                        actions: [
                                          IconButton(
                                            icon: const Icon(Icons.close),
                                            color: Colors.black,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      body: Container(
                                        padding: const EdgeInsets.all(16),
                                        height:
                                            300, // Defina o tamanho inicial do BottomSheet aqui
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Conteúdo do BottomSheet para habilidadeQ
                                            Row(
                                              children: [
                                                Image.asset(
                                                  championModel.habilidadeRUrl,
                                                  width:
                                                      screenSize.width * 0.25,
                                                  height:
                                                      screenSize.width * 0.25,
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      championModel
                                                          .habilidadeRNome,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(championModel
                                                        .habilidadeRDescricao),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // Adicione outros widgets conforme necessário
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        championModel.habilidadeRUrl),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 15,
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[900],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        'R',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey[300],
              thickness: 0,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ),
      ),
    );
  }
}
