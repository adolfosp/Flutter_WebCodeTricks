import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Stream<String> stream;
  final Function(String) onChanged;

  InputField({this.icon, this.hint, this.obscure, this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            decoration: InputDecoration(
              icon: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black, fontSize: 17),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              contentPadding:
                  EdgeInsets.only(left: 5, right: 30, bottom: 30, top: 30),
              errorText: snapshot.hasError ? snapshot.error : null,
            ),
            style: TextStyle(color: Colors.white),
            obscureText: obscure,
          );
        });
  }
}
