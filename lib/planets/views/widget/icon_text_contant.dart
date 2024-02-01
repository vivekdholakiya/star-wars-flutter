import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconContent extends StatefulWidget {
  const IconContent(
      {Key? key, required this.icon, required this.label, required this.value})
      : super(key: key);

  final IconData icon;
  final String label;
  final String value;

  @override
  State<IconContent> createState() => _IconContentState();
}

class _IconContentState extends State<IconContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          widget.icon,
          size: 50.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
          child: Text(
            widget.label,
            style: TextStyle(
              inherit: true,
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
          child: Text(
            widget.value,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                fontSize: 22.0),
          ),
        )
      ],
    );
  }
}
