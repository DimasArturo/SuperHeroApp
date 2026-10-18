import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroDetailScreen extends StatelessWidget {
  final SuperheroDetailResponse superhero;
  const SuperheroDetailScreen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    final stats = [
      (
        label: "Power",
        value: superhero.powerStatsResponse.power,
        color: Colors.red,
      ),
      (
        label: "Intelligence",
        value: superhero.powerStatsResponse.intelligence,
        color: Colors.blue,
      ),
      (
        label: "Strength",
        value: superhero.powerStatsResponse.strength,
        color: Colors.grey,
      ),
      (
        label: "Speed",
        value: superhero.powerStatsResponse.speed,
        color: Colors.green,
      ),
      (
        label: "Durability",
        value: superhero.powerStatsResponse.durability,
        color: Colors.deepOrange,
      ),
      (
        label: "Combat",
        value: superhero.powerStatsResponse.combat,
        color: Colors.black,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Superhero ${superhero.name}")),
      body: Column(
        children: [
          Image.network(
            superhero.url,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
            errorBuilder: (context, error, stackTrace) => const ColoredBox(
              color: Colors.black12,
              child: Center(
                child: Icon(
                  Icons.broken_image_outlined,
                  size: 64,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Text(superhero.name, style: TextStyle(fontSize: 28)),
          Text(
            superhero.realName,
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            width: double.infinity,
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: stats
                  .map(
                    (stat) => _StatBar(
                      label: stat.label,
                      value: stat.value,
                      color: stat.color,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBar extends StatelessWidget {
  const _StatBar({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final parsedValue = double.tryParse(value) ?? 0;
    final barHeight = parsedValue.clamp(0.0, 100.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(height: barHeight, width: 20, color: color),
        Text(label),
      ],
    );
  }
}
