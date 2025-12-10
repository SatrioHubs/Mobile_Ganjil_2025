import 'package:flutter/material.dart';

void main() {
  runApp(const PeriodicTableApp());
}

class PeriodicTableApp extends StatelessWidget {
  const PeriodicTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabel Periodik - Logam Mulia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const Scaffold(body: SafeArea(child: NobleMetalsTable())),
    );
  }
}

class NobleMetalsTable extends StatelessWidget {
  const NobleMetalsTable({super.key});

  // Noble metals with their (period, group) positions (1-based)
  static const Map<String, Map<String, Object>> noble = {
    'Au': {'name': 'Gold', 'period': 6, 'group': 11},
    'Ag': {'name': 'Silver', 'period': 5, 'group': 11},
    'Pt': {'name': 'Platinum', 'period': 6, 'group': 10},
    'Pd': {'name': 'Palladium', 'period': 5, 'group': 10},
    'Rh': {'name': 'Rhodium', 'period': 5, 'group': 9},
    'Ir': {'name': 'Iridium', 'period': 6, 'group': 9},
    'Os': {'name': 'Osmium', 'period': 6, 'group': 8},
    'Ru': {'name': 'Ruthenium', 'period': 5, 'group': 8},
  };

  @override
  Widget build(BuildContext context) {
    // Periods 1..7, Groups 1..18
    const periods = 7;
    const groups = 18;

    return Column(
      children: [
        const SizedBox(height: 12),
        const Text(
          'TABEL PERIODIK - LOGAM MULIA',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Table(
                defaultColumnWidth: const FixedColumnWidth(60),
                border: TableBorder.all(color: Colors.black26),
                children: List.generate(periods, (r) {
                  final period = r + 1;
                  return TableRow(
                    children: List.generate(groups, (c) {
                      final group = c + 1;
                      // find metal at this position
                      final entry = noble.entries.firstWhere(
                        (e) =>
                            (e.value['period'] as int) == period &&
                            (e.value['group'] as int) == group,
                        orElse: () => const MapEntry('', <String, Object>{
                          'name': '',
                          'period': 0,
                          'group': 0,
                        }),
                      );

                      if (entry.key != '') {
                        final symbol = entry.key;
                        final name = entry.value['name'] as String;
                        return _MetalCell(symbol: symbol, name: name);
                      }

                      return const SizedBox(height: 60, width: 60);
                    }),
                  );
                }),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Satrio Ahmad Ramadhani • 2341720163',
          style: TextStyle(color: Colors.grey.shade700),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _MetalCell extends StatelessWidget {
  final String symbol;
  final String name;

  const _MetalCell({required this.symbol, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      color: Colors.yellow[700],
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                symbol,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
