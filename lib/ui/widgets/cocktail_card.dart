import 'package:flutter/material.dart';
import '../../../model/cocktail.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailCard({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                cocktail.imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  cocktail.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Тип: ${cocktail.alcoholic}\nКатегория: ${cocktail.category}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "550 c",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'В корзину',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7B8B27),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_outward,
                        size: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
