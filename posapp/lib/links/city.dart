import 'package:flutter/material.dart';

class Pokhara extends StatelessWidget {
  const Pokhara({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Pokhara",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              Row(
                children: [
                  Positioned(
                    left: 2.0,
                    child: Icon(
                      Icons.navigation,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    " Kasaki",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              //color: Colors.amber,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      left: 10.0,
                      child: Icon(
                        Icons.location_on,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      left: 2.0,
                      child: Icon(
                        Icons.location_on,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
