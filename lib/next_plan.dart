import 'package:flutter/material.dart';

// --- Constants ---
// Moving magic numbers to constants makes them easy to find and change.
const double _kHorizontalPadding = 16.0;
const double _kVerticalPadding = 16.0;

/// This is the main screen widget. Its only job is to build the
/// basic page layout (Scaffold, AppBar, scrolling body) and
/// compose the smaller widgets together.
class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      // The SafeArea is kept here as it's part of the main page structure
      body: SafeArea(
        child: SingleChildScrollView(
          // This Container is responsible for the gradient background
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue.withOpacity(0.0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            // The Padding widget handles the main content padding
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: _kHorizontalPadding,
                vertical: _kVerticalPadding,
              ),
              // The main layout is a Column of our new, smaller widgets
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Each section of the UI is now its own widget
                  const _UpNextSection(),
                  const SizedBox(height: 10),
                  const _MealCard(),
                  const SizedBox(height: 16),
                  _ViewFullPlanButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- 1. Up Next Section Widget ---
/// This widget is responsible *only* for displaying the "Up Next" title
/// and the time/item count.
///
/// Refactor Note: I changed your inner `Column` to a `Row` here.
/// Using `MainAxisAlignment.spaceBetween` and `CrossAxisAlignment.baseline`
/// is standard for a Row, but has no effect on a Column. This layout
/// now correctly places "Mid-morning" and "11:00 AM" on the same line.
class _UpNextSection extends StatelessWidget {
  const _UpNextSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Up Next',
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Row(
          // --- MODIFIED: Was Column, now Row ---
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const Text(
              'Mid-morning',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '11:00 AM   |   3 items',
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}

// --- 2. Meal Card Widget ---
/// This widget is responsible for drawing the Card and arranging
/// the meal items inside it.
class _MealCard extends StatelessWidget {
  const _MealCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // It composes the reusable _MealItem widget
            const _MealItem(
              icon: Icons.fastfood_outlined,
              name: '1. Moong Dal Chilla',
              quantity: '2 ladies (60g each)',
              calories: '220 kcal',
            ),
            const Divider(height: 20),
            const _MealItem(
              icon: Icons.egg_outlined,
              name: '2. Boiled Egg',
              quantity: '1 egg (50g)',
              calories: '68 kcal',
            ),
            const Divider(height: 20),
            const _MealItem(
              icon: Icons.local_cafe_outlined,
              name: '3. Green Tea (No Sugar)',
              quantity: '1 cup (50g)',
              calories: '3 kcal',
            ),
          ],
        ),
      ),
    );
  }
}

// --- 3. Meal Item Widget ---
/// This is the most reusable widget. It's responsible *only* for
/// displaying a single meal item row. It's stateless and configured
/// entirely by the parameters passed to it.
class _MealItem extends StatelessWidget {
  const _MealItem({
    required this.icon,
    required this.name,
    required this.quantity,
    required this.calories,
  });

  final IconData icon;
  final String name;
  final String quantity;
  final String calories;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[100],
          child: Icon(icon, color: Colors.grey[600], size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    quantity,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.info_outline, size: 13, color: Colors.blue[400]),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          calories,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }
}

// --- 4. View Full Plan Button ---
/// This widget is responsible for the "View full plan" button.
/// It's a StatelessWidget, and it gets the `BuildContext` it needs
/// for the SnackBar from its *own* `build` method.
class _ViewFullPlanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // It can access ScaffoldMessenger using its own context
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Loading full plan...')));
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min, // Use min to center the content
          children: [
            Text(
              'View full plan',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward, color: Colors.blue, size: 18),
          ],
        ),
      ),
    );
  }
}
