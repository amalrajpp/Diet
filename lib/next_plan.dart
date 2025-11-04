import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // Define the colors for the gradient
                colors: [
                  Colors.blue, // Starting color (top)
                  Colors.blue.withOpacity(0.0),
                ],
                // 'begin' sets where the gradient starts
                begin: Alignment.topCenter,
                // 'end' sets where the gradient stops
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUpNextSection(),
                  const SizedBox(height: 10),
                  _buildMealCard(),
                  const SizedBox(height: 16),
                  // --- MODIFIED: Passed context ---
                  _buildViewFullPlan(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpNextSection() {
    // (This widget code is unchanged)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Up Next', style: TextStyle(fontSize: 13, color: Colors.black)),
        const SizedBox(height: 4),
        Column(
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

  Widget _buildMealCard() {
    // (This widget code is unchanged)
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildMealItem(
              icon: Icons.fastfood_outlined,
              name: '1. Moong Dal Chilla',
              quantity: '2 ladies (60g each)',
              calories: '220 kcal',
            ),
            const Divider(height: 20),
            _buildMealItem(
              icon: Icons.egg_outlined,
              name: '2. Boiled Egg',
              quantity: '1 egg (50g)',
              calories: '68 kcal',
            ),
            const Divider(height: 20),
            _buildMealItem(
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

  Widget _buildMealItem({
    required IconData icon,
    required String name,
    required String quantity,
    required String calories,
  }) {
    // (This widget code is unchanged)
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

  // --- MODIFIED: Added context and SnackBar ---
  Widget _buildViewFullPlan(BuildContext context) {
    return Center(
      child: TextButton(
        // --- MODIFIED: Added SnackBar ---
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Loading full plan...')));
        },
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
