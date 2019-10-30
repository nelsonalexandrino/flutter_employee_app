import 'package:flutter/material.dart';

class ComunicationOwner extends StatelessWidget {
  final String owner;

  ComunicationOwner(this.owner);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {},
        color: Colors.white, //0xFFA60024
        child: Text(
          owner,
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }
}
