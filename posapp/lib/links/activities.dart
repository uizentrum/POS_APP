import 'package:flutter/material.dart';
import 'package:travelapp/models/destinations_model.dart';

class PokharaActivity extends StatefulWidget {
  const PokharaActivity({Key? key}) : super(key: key);

  @override
  _PokharaActivityState createState() => _PokharaActivityState();
}

class _PokharaActivityState extends State<PokharaActivity> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) {
          return Container();
        });
  }
}
