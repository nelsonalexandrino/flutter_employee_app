import 'package:flutter/material.dart';

var pageList = [
  WellcomeCard(
    imageUri: 'assets/correr.png',
    title: 'Comunicações',
    body: 'Agora pode ver as comunicações internas, na palma da sua mão',
  ),
  WellcomeCard(
    imageUri: 'assets/futebol.png',
    title: 'Produtos',
    body: 'Os produtos que o banco tem exclusivamente para os trabalhadores',
  ),
  WellcomeCard(
    imageUri: 'assets/yoga.png',
    title: 'Contactos',
    body: 'Os contactos de todos os seus colegas na palma da sua mão',
  ),
  WellcomeCard(
    imageUri: 'assets/yoga.png',
    title: 'Simulador de crédito',
    body: 'Agora pode simular o crédito onde estiver, a qualquer hora',
  )
];

class WellcomeCard {
  final String imageUri;
  final String title;
  final String body;

  WellcomeCard(
      {@required this.imageUri, @required this.title, @required this.body});
}
