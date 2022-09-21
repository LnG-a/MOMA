
import 'package:flutter/material.dart';

class PlanningMenu extends StatelessWidget {
  const PlanningMenu({
    Key? key,
    required this.text,
    required this.subtext,
    required this.icon,
    this.press,
  }) : super(key: key);

  final Icon icon;
  final String text;
  final VoidCallback? press;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          primary: Colors.black,
          padding: const EdgeInsets.all(20),
        ),
        onPressed: press,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              width: 300,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        text, style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        subtext,
                        style: const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black,),
          ],
        ),
      ),
    );
  }
}