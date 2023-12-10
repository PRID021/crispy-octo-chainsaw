import 'package:flutter/material.dart';

class FavoriteMusicTypeSection extends StatelessWidget {
  const FavoriteMusicTypeSection({super.key});

  static final favorites = [
    "Rap music",
    "Indie",
    "Folk music",
    "Rock and roll",
    "Pop",
    "Jazz & Blue",
    "R&B",
    "Classic folk",
    "Electric"
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 24,
      children: favorites
          .map(
            (e) => FilterChip(
              label: Text(e),
              backgroundColor: Colors.transparent,
              shape: const StadiumBorder(side: BorderSide(color: Colors.pink)),
              onSelected: (bool value) {},
            ),
          )
          .toList(),
    );
  }
}
