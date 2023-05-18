import 'package:flutter/material.dart';
import 'package:pokedox/const/poke_container.dart';
import 'package:pokedox/const/text_style.dart';

import '../pokemodel.dart';

Widget landscapeContainer(PokeModel pokeModel){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingTextStyle(
            color: Colors.white,
            size: 36,
            text: pokeModel.name,
          ),
          Row(
            children: [
              pokeContainer(
                color: Colors.white,
                size: 16,
                text: pokeModel.typeofpokemon!.first,
              ),
              const SizedBox(
                width: 6,
              ),
              pokeContainer(
                color: Colors.white,
                size: 16,
                text: pokeModel.typeofpokemon!.last,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),

        ],
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/pokeball3.png",
              width: 200,
              color: Colors.white.withOpacity(0.5),
            ),
            Positioned(
              bottom: -5,
              left: 12,
              child: Image.network(
                pokeModel.imageurl.toString(),
                width: 160,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}