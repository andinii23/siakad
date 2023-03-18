import 'package:flutter/material.dart';

class cardApp extends StatefulWidget {
  final String icon;
  final String label;
  final VoidCallback? onTap;
  const cardApp(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  State<cardApp> createState() => _cardAppState();
}

// ignore: camel_case_types
class _cardAppState extends State<cardApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        constraints: const BoxConstraints(
            minWidth: 150.0, maxWidth: 300.0, minHeight: 100.0),
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          border: Border.all(
            color: Colors.orange,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.icon,
              width: 25.0,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}