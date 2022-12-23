import 'package:flutter/material.dart';

class Messagefield extends StatelessWidget {
  const Messagefield({Key? key, this.messagedata = ''}) : super(key: key);
  final String messagedata;
  @override
  Widget build(BuildContext context) {
    TextEditingController controls = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 200,
          height: 50,
          child: TextField(
            autofocus: true,
            controller: controls,
            style: const TextStyle(color: Colors.white, fontFamily: 'Pop'),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                filled: true,
                fillColor: Colors.white38),
            onChanged: ((value) {
              value = messagedata;
            }),
          )),
    );
  }
}
