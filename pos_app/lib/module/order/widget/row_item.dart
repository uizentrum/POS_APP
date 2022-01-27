import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String label;
  final String value;

  RowItem({
    this.label,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 4.0,
        bottom: 4.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Spacer(),
          Expanded(
            child: Text(
              "$value",
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
