import 'package:flutter/material.dart';

/// A data model class to hold information about a single meal.
class MealItem {
  final String id;
  final String title;
  final String subtitle;
  final String calories;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;

  const MealItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.calories,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
  });
}
