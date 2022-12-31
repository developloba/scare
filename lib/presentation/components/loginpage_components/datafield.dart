import 'package:flutter/material.dart';

class Datafield extends StatefulWidget {
  Datafield(
      {Key? key,
      this.inputype = TextInputType.text,
      required this.textEditingController,
      required this.hinttext,
      this.obsuretext = false})
      : super(key: key);
  final TextInputType inputype;
  final TextEditingController textEditingController;
  final String hinttext;
  bool obsuretext;

  @override
  State<Datafield> createState() => _DatafieldState();
}

class _DatafieldState extends State<Datafield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.7,
      child: TextField(
        maxLength: 15,
        obscureText: widget.obsuretext,
        keyboardType: widget.inputype,
        controller: widget.textEditingController,
        decoration: InputDecoration(
            suffixIcon: widget.obsuretext == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obsuretext = !widget.obsuretext;
                      });
                    },
                    icon: Icon(widget.obsuretext
                        ? Icons.visibility
                        : Icons.visibility_off))
                : null,
            hintText: widget.hinttext,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white))),
      ),
    );
  }
}
