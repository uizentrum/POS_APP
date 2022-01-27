import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExStream extends StatelessWidget {
  final Stream<DocumentSnapshot> stream;
  final Function(DocumentSnapshot item) builder;

  ExStream({
    this.stream,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (stream.hasError) {
          print(stream.error);
          return Center(child: Text(stream.error.toString()));
        }

        DocumentSnapshot querySnapshot = stream.data;

        if (querySnapshot == null) {
          return Center(child: Text(stream.error.toString()));
        }

        return builder(querySnapshot);
      },
    );
  }
}
