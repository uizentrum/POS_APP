import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_app/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExStreamRadio extends StatefulWidget {
  final String id;
  final String label;
  final String value;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final bool wrapped;

  //---
  final String valueField;
  final String labelField;
  final Stream<QuerySnapshot> stream;

  ExStreamRadio({
    this.id,
    this.label,
    this.value,
    this.onChanged,
    this.keyboardType,
    this.wrapped = false,
    this.labelField,
    this.valueField,
    this.stream,
  });

  @override
  _ExStreamRadioState createState() => _ExStreamRadioState();
}

class _ExStreamRadioState extends State<ExStreamRadio> {
  String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    // if (widget.value == null) {
    //   selectedValue = widget.items[0]["value"];
    //   Input.set(widget.id, selectedValue);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.stream,
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (stream.hasError) {
          print(stream.error);
          return Center(child: Text(stream.error.toString()));
        }

        QuerySnapshot querySnapshot = stream.data;

        if (querySnapshot == null) {
          return Center(child: Text(stream.error.toString()));
        }

        // return Container(
        //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        //   child: ListView.builder(
        //     itemCount: querySnapshot.size,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       var item = querySnapshot.docs[index].data();
        //       item["id"] = querySnapshot.docs[index].id;
        //     },
        //   ),
        // );

        var items = querySnapshot.docs;

        return Container(
          child: Container(
            padding: EdgeInsets.all(10.0),
            height: 80.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                    top: 4.0,
                    bottom: 4.0,
                  ),
                  child: Text("${widget.label}"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = items[index].data();

                      bool selected = selectedValue == item[widget.valueField];

                      return InkWell(
                        onTap: () {
                          if (selectedValue ==
                              item[widget.valueField].toString()) {
                            selectedValue = null;
                            setState(() {});
                            Input.set(widget.id, selectedValue);
                            if (widget.onChanged != null)
                              widget.onChanged(selectedValue);
                            return;
                          }
                          selectedValue = item[widget.valueField].toString();
                          setState(() {});

                          Input.set(widget.id, selectedValue);
                          if (widget.onChanged != null)
                            widget.onChanged(selectedValue);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          margin: EdgeInsets.only(right: 10.0),
                          height: theme.mediumHeight,
                          decoration: BoxDecoration(
                            borderRadius: theme.largeRadius,
                            color:
                                selected ? theme.primary : theme.inactiveColor,
                          ),
                          child: Center(
                              child: Text(
                            "${item[widget.labelField]}",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: selected ? Colors.white : theme.textColor,
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
