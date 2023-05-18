import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riotgg/features/main/pages/champion/components/custom_list_champions.dart';
import 'package:riotgg/features/main/pages/champion/controller/champion_controller.dart';
import 'package:riotgg/features/main/pages/champion/view/champion_state.dart';

class ChampionPage extends StatefulWidget {
  const ChampionPage({super.key});

  @override
  State<ChampionPage> createState() => _ChampionPageState();
}

class _ChampionPageState extends State<ChampionPage> {
  String selectedLane = '';

  void _selectLane(String lane) {
    setState(() {
      selectedLane = lane;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocBuilder<ChampionController, ChampionState>(
      builder: (context, state) {
        debugPrint(state.status.toString());
        debugPrint(state.champions.toString());
        if (state.status == ChampionStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (state.status == ChampionStatus.error) {
          return const Center(
            child: Text('Erro ao carregar pagina'),
          );
        } else if (state.status == ChampionStatus.initial) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenSize.width * 0.045),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildLaneImageTop(
                          'assets/icons/lanes/Top_icon_not_select.png',
                          'assets/icons/lanes/Top_icon.png',
                          'Top',
                        ),
                        SizedBox(width: screenSize.width * 0.04),
                        buildLaneImageJg(
                          'assets/icons/lanes/Jungle_icon_not_select.png',
                          'assets/icons/lanes/Jungle_icon.png',
                          'Jungle',
                        ),
                        SizedBox(width: screenSize.width * 0.04),
                        buildLaneImageMid(
                          'assets/icons/lanes/Middle_icon_not_select.png',
                          'assets/icons/lanes/Middle_icon.png',
                          'Middle',
                        ),
                        SizedBox(width: screenSize.width * 0.04),
                        buildLaneImageAdc(
                          'assets/icons/lanes/Bottom_icon_not_select.png',
                          'assets/icons/lanes/Bottom_icon.png',
                          'Bottom',
                        ),
                        SizedBox(width: screenSize.width * 0.04),
                        buildLaneImageSup(
                          'assets/icons/lanes/Support_icon_not_select.png',
                          'assets/icons/lanes/Support_icon.png',
                          'Support',
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.7,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.champions?.length ?? 0,
                            itemBuilder: (context, index) {
                              final champion = state.champions?[index];

                              return ChampionListItem(
                                champion: champion!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ));
        } else {
          return const Center(
            child: Text('ERRO AI'),
          );
        }
      },
    );
  }

  Widget buildLaneImage(String normalImage, String selectedImage, String lane) {
    final bool isSelected = selectedLane == lane;

    return GestureDetector(
      onTap: () {
        _selectLane(lane);
        context.read<ChampionController>().getChampions();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          isSelected ? selectedImage : normalImage,
        ),
      ),
    );
  }
  Widget buildLaneImageTop(String normalImage, String selectedImage, String lane) {
    final bool isSelected = selectedLane == lane;

    return GestureDetector(
      onTap: () {
        _selectLane(lane);
        context.read<ChampionController>().getChampionsTop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          isSelected ? selectedImage : normalImage,
        ),
      ),
    );
  }
  Widget buildLaneImageJg(String normalImage, String selectedImage, String lane) {
    final bool isSelected = selectedLane == lane;

    return GestureDetector(
      onTap: () {
        _selectLane(lane);
        context.read<ChampionController>().getChampionsJg();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          isSelected ? selectedImage : normalImage,
        ),
      ),
    );
  }
  Widget buildLaneImageMid(String normalImage, String selectedImage, String lane) {
    final bool isSelected = selectedLane == lane;

    return GestureDetector(
      onTap: () {
        _selectLane(lane);
        context.read<ChampionController>().getChampionsMid();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          isSelected ? selectedImage : normalImage,
        ),
      ),
    );
  }
  Widget buildLaneImageAdc(String normalImage, String selectedImage, String lane) {
    final bool isSelected = selectedLane == lane;

    return GestureDetector(
      onTap: () {
        _selectLane(lane);
        context.read<ChampionController>().getChampionsAdc();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          isSelected ? selectedImage : normalImage,
        ),
      ),
    );
  }
  Widget buildLaneImageSup(String normalImage, String selectedImage, String lane) {
    final bool isSelected = selectedLane == lane;

    return GestureDetector(
      onTap: () {
        _selectLane(lane);
        context.read<ChampionController>().getChampionsSup();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Image.asset(
          isSelected ? selectedImage : normalImage,
        ),
      ),
    );
  }
}
