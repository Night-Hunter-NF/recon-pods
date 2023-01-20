import 'package:flutter/material.dart';
import '../ffi/ffi.dart' if (dart.library.html) '../ffi/ffi_web.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  late Future<double> result;
  double? option_1;
  double? option_2;

  @override
  void initState() {
    super.initState();
    result = api.addNumber(a: 1, b: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'option 1',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    option_1 = double.parse(value);
                  });
                },
              ),
            ),
            Flexible(
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'option 2',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    option_2 = double.parse(value);
                  });
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  if (option_1 != null && option_2 != null) {
                    setState(() {
                      result = api.addNumber(a: option_1!, b: option_2!);
                    });
                  }
                },
                child: const Text('enter'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<dynamic>>(
                future: Future.wait([result]),
                builder: ((context, snap) {
                  if (snap.error != null) {
                    // An error has been encountered, so give an appropriate response and
                    // pass the error details to an unobstructive tooltip.
                    debugPrint(snap.error.toString());
                    return Tooltip(
                      message: snap.error.toString(),
                      child: const Text('Error'),
                    );
                  }
                  // Guard return here, the data is not ready yet.
                  final data = snap.data;
                  if (data == null) return const CircularProgressIndicator();

                  final double result = data[0];

                  return Text('$option_1 + $option_2 = $result');
                }))
          ],
        ),
      ],
    );
  }
}
