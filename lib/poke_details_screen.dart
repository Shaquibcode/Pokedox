import 'package:flutter/material.dart';
import 'package:pokedox/const/poke_container.dart';
import 'package:pokedox/const/portrait_container.dart';
import 'package:pokedox/const/rowstyle.dart';
import 'package:pokedox/const/stat_const.dart';
import 'package:pokedox/const/text_style.dart';
import 'package:pokedox/pokemodel.dart';

import 'const/landscape_container.dart';

class PokeDetailsScreen extends StatelessWidget {
  final PokeModel pokeModel;
   const PokeDetailsScreen({Key? key, required this.pokeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        backgroundColor: Colors.red,
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child:
                orientation == Orientation.portrait ?
                portraitContainer(pokeModel) : landscapeContainer(pokeModel),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: "About",
                        ),
                        Tab(
                          text: "Base Stats",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                normalTextStyle(
                                  color: Colors.black,
                                  size: 16,
                                  text: "It Can be seen nappin in the jungle having a seed on its back."
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: width - 100,
                                    child: Card(
                                      color: const Color.fromRGBO(239, 239, 240, 2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                headingTextStyle(
                                                  color: Colors.grey,
                                                  size: 16,
                                                  text: "Height",
                                                ),
                                                const SizedBox(
                                                  height: 6,
                                                ),
                                                headingTextStyle(
                                                  color: Colors.grey,
                                                  size: 16,
                                                  text: pokeModel.height,
                                                ),
                                              ],
                                            ),

                                            Column(
                                              children: [
                                                headingTextStyle(
                                                  color: Colors.grey,
                                                  size: 16,
                                                  text: "Weight",
                                                ),
                                                const SizedBox(
                                                  height: 6,
                                                ),
                                                headingTextStyle(
                                                  color: Colors.grey,
                                                  size: 16,
                                                  text: pokeModel.weight,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                headingTextStyle(
                                  color: Colors.black,
                                  size: 16,
                                  text: "Breeding",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                rowStyle(
                                  text: "Gender",
                                  value: "Male",
                                ),
                                rowStyle(
                                  text: "Egg cycle",
                                  value: pokeModel.eggGroups,
                                ),
                                rowStyle(
                                  text: "Evolution",
                                  value: pokeModel.evolutions!.first.toString(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child:  SingleChildScrollView(
                              child: Column(
                                children: [
                                   const SizedBox(
                                    height: 15,
                                  ),
                                  statRow(
                                    text: "HP",
                                    value: pokeModel.hp.toString(),
                                  ),
                                  statRow(
                                      text: "Attack",
                                      value: pokeModel.attack.toString(),
                                  ),
                                  statRow(
                                      text: "Defense",
                                      value: pokeModel.defense.toString(),
                                  ),
                                  statRow(
                                      text: "Speed",
                                      value: pokeModel.speed.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
