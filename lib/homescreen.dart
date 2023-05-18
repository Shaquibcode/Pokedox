import 'package:flutter/material.dart';
import 'package:pokedox/api_services.dart';
import 'package:pokedox/const/poke_container.dart';
import 'package:pokedox/poke_details_screen.dart';
import 'package:pokedox/pokemodel.dart';

import 'const/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'PokeDox',
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: FutureBuilder<List<PokeModel>>(
                    future: getPokeDetails(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: pokeList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: width < 600
                                ? 2
                                : width < 1100
                                    ? 4
                                    : 6,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PokeDetailsScreen(
                                      pokeModel: snapshot.data![index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: -20,
                                      right: -20,
                                      child: Image.asset(
                                        'assets/pokeball3.png',
                                        width: 150,
                                        color: Colors.white.withOpacity(.5),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 2,
                                      right: 6,
                                      child: Image.network(
                                        snapshot.data![index].imageurl
                                            .toString(),
                                        width: 150,
                                      ),
                                    ),
                                    Positioned(
                                      top: 2,
                                      left: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          headingTextStyle(
                                            color: Colors.white,
                                            size: 24,
                                            text: snapshot.data![index].name
                                                .toString(),
                                          ),
                                          pokeContainer(
                                            color: Colors.white,
                                            size: 14,
                                            text: snapshot.data![index]
                                                .typeofpokemon!.first,
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          pokeContainer(
                                            color: Colors.white,
                                            size: 14,
                                            text: snapshot.data![index]
                                                .typeofpokemon!.last,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
