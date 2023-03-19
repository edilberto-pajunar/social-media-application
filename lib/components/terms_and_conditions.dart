import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  final onPressed;
  const TermsAndConditions({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 45.0),
          child: Text(
            "Terms and condition",
            style: TextStyle(color: Colors.white.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
