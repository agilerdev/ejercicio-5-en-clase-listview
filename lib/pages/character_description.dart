import 'dart:math';

import 'package:cartoons_flutter/model/character.dart';
import 'package:cartoons_flutter/model/characters_data.dart';
import 'package:flutter/material.dart';

class CharacterDescription extends StatefulWidget {
  CharacterDescription({required this.character, Key? key}) : super(key: key);
  final Character character;

  @override
  State<CharacterDescription> createState() => _CharacterDescriptionState();
}

class _CharacterDescriptionState extends State<CharacterDescription> {
  double estrellas = 0.0;
  @override
  void initState() {
    super.initState();
    estrellas = widget.character.stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Descripcion personaje',
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Descripcion de los personajes',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Image.asset(widget.character.image),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: () {
                estrellas += 1;
                setState(() {});
              },
              child: Text(
                estrellas.toString(),
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Regresar',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
