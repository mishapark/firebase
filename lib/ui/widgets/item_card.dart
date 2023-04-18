import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isPurchased;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.title,
    required this.isPurchased,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: isPurchased ? Colors.red : Colors.green,
                  decoration: isPurchased ? TextDecoration.lineThrough : null,
                ),
              ),
              isPurchased
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
