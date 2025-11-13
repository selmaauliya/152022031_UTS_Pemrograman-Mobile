import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String display = '0';

  void _onPress(String value) {
    setState(() {
      if (value == 'C') {
        display = '0';
        return;
      }
      if (value == '=') {
        // very simple evaluator using double and basic ops
        try {
          final result = _evaluate(display);
          display = result.toString();
        } catch (e) {
          display = 'Error';
        }
        return;
      }
      if (display == '0') {
        display = value;
      } else {
        display += value;
      }
    });
  }

  double _evaluate(String expr) {
    // Hilangkan spasi
    expr = expr.replaceAll(' ', '');

    try {
      // Pisahkan operator dan operand (sangat sederhana, bukan parser penuh)
      if (expr.contains('+')) {
        final parts = expr.split('+');
        return double.parse(parts[0]) + double.parse(parts[1]);
      } else if (expr.contains('-')) {
        final parts = expr.split('-');
        return double.parse(parts[0]) - double.parse(parts[1]);
      } else if (expr.contains('*')) {
        final parts = expr.split('*');
        return double.parse(parts[0]) * double.parse(parts[1]);
      } else if (expr.contains('/')) {
        final parts = expr.split('/');
        return double.parse(parts[0]) / double.parse(parts[1]);
      } else {
        // Jika tidak ada operator, kembalikan angka aslinya
        return double.parse(expr);
      }
    } catch (e) {
      // Jika ada kesalahan parsing, lempar Error
      throw Exception('Invalid expression');
    }
  }


  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7','8','9','/',
      '4','5','6','*',
      '1','2','3','-',
      '0','.','=','+',
      'C','^2','√','DEL'
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(display, style: const TextStyle(fontSize: 34)),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: 1.6,
            physics: const NeverScrollableScrollPhysics(),
            children: buttons.map((b) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: ElevatedButton(
                  onPressed: () {
                    // sementara tombol logika sederhana
                    if (b == 'DEL') {
                      setState(() {
                        if (display.length > 1) {
                          display = display.substring(0, display.length - 1);
                        } else {
                          display = '0';
                        }
                      });
                    } else if (b == '^2') {
                      setState(() {
                        try {
                          final v = double.parse(display);
                          display = (v * v).toString();
                        } catch (e) { display = 'Error'; }
                      });
                    } else if (b == '√') {
                      setState(() {
                        try {
                          final v = double.parse(display);
                          display = sqrt(v).toString();
                        } catch (e) { display = 'Error'; }
                      });
                    } else if (b == '=') {
                      // leave for later/evaluator
                      _onPress('=');
                    } else if (b == 'C') {
                      _onPress('C');
                    } else {
                      _onPress(b);
                    }
                  },
                  child: Text(b, style: const TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
