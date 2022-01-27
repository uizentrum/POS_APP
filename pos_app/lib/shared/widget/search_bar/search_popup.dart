import 'package:flutter/material.dart';
import 'package:pos_app/core.dart';

class SearchPopup extends StatefulWidget {
  final String id;
  final Function(String search) onSearch;

  SearchPopup({
    this.id,
    this.onSearch,
  });

  @override
  _SearchPopupState createState() => _SearchPopupState();
}

class _SearchPopupState extends State<SearchPopup> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 250), () {
      focusNode.requestFocus();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: TextField(
          focusNode: focusNode,
          controller: textEditingController,
          decoration: InputDecoration.collapsed(
            hintText: "Search",
          ),
          onSubmitted: (text) {
            Input.set("${widget.id}", text);
            Get.back();
            widget.onSearch(text);
          },
        ),
      ),
      body: Stack(),
    );
  }
}
