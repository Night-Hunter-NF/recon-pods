import 'package:flutter/material.dart';

class PlatformText extends StatelessWidget {
  final String? text;
  final String? release;
  const PlatformText({Key? key, @required this.text, this.release})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(release == null ? '$text' : '$text ($release)',
        style: const TextStyle(color: Colors.black));
  }
}
