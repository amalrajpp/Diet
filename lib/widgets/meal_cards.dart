import 'package:flutter/material.dart';
import 'package:health/model/meal_item.dart'; // Import the data model

/// A reusable widget that displays a single meal item in a card.
class MealCards extends StatelessWidget {
  final MealItem meal;
  final String number;

  const MealCards({super.key, required this.meal, required this.number});

  // Define a static color for the meal card background.
  static const Color _mealCardBg = Color(0xFFFFFBF8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 28),
      decoration: BoxDecoration(
        color: _mealCardBg, // Use the defined background color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        // Add the gradient for the fading effect at the bottom
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _mealCardBg, // Start with the solid background color
            _mealCardBg.withOpacity(0.6), // Slightly transparent
            _mealCardBg.withOpacity(0.0), // Fully transparent
          ],
          stops: const [0.0, 0.8, 1.0], // Control the gradient stops
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Data now comes from the 'meal' object
          CircleAvatar(
            radius: 20,
            backgroundColor: meal.iconBackgroundColor,
            child: Icon(meal.icon, size: 20, color: meal.iconColor),
          ),
          const SizedBox(width: 10),
          Text(
            number, // The number is passed in separately
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE85D4A),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Data now comes from the 'meal' object
                Text(
                  meal.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // Data now comes from the 'meal' object
                    Text(
                      meal.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.info_outline,
                      size: 13,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Data now comes from the 'meal' object
          Text(
            meal.calories,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
