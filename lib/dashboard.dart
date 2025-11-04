import 'package:flutter/material.dart';

// Import your other pages
import 'package:health/diet_plan.dart';
import 'package:health/next_plan.dart';
import 'package:health/result_screen.dart';

// Import your new clean files
import 'package:health/model/meal_item.dart';
import 'package:health/widgets/meal_cards.dart';

class HealthDashboardScreen extends StatelessWidget {
  const HealthDashboardScreen({super.key});

  // --- Design Colors ---
  static const Color _titleRed = Color(0xFFE85D4A);
  static const Color _macrosRed = Color(0xFFE85D4A);

  // --- DATA ---
  // This mock data list defines the content for the breakfast meal list.
  static const List<MealItem> _breakfastMeals = [
    MealItem(
      id: 'm1',
      icon: Icons.restaurant_menu_outlined,
      iconColor: Color(0xFFEF6C00), // Colors.orange.shade700
      iconBackgroundColor: Color(0xFFFFF3E0), // Colors.orange.shade50
      title: "Moong Dal Chilla",
      subtitle: "2 ladles (60g each)",
      calories: "220 kcal",
    ),
    MealItem(
      id: 'm2',
      icon: Icons.local_drink_outlined,
      iconColor: Color(0xFF6A1B9A), // Colors.purple.shade700
      iconBackgroundColor: Color(0xFFF3E5F5), // Colors.purple.shade50
      title: "Boiled Egg",
      subtitle: "1 egg (50g)",
      calories: "68 kcal",
    ),
    MealItem(
      id: 'm3',
      icon: Icons.local_cafe_outlined,
      iconColor: Color(0xFF2E7D32), // Colors.green.shade700
      iconBackgroundColor: Color(0xFFE8F5E9), // Colors.green.shade50
      title: "Green Tea (No Sugar)",
      subtitle: "1 cup (200ml)",
      calories: "3 kcal",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFCE3BB), Color(0xFFF79C81)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                const SizedBox(height: 15),
                _buildBreakfastTitle(context),
                const SizedBox(height: 15),
                _buildMealList(),
                _buildMacrosGoal(),
                _buildViewPlanLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the top header with "Good morning" and icons
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 18.0),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi sparsh",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Good morning",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HealthResultScreen(),
                    ),
                  );
                },
                child: Image.asset('assets/message.png', width: 40, height: 40),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DietPlanScreen(),
                    ),
                  );
                },
                child: Image.asset('assets/profile.png', width: 40, height: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the "It's Breakfast time!" section
  Widget _buildBreakfastTitle(BuildContext context) {
    return Column(
      children: [
        const Text(
          "It's Breakfast time!",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: _titleRed,
          ),
        ),
        const SizedBox(height: 6),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'As per your ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red[300],
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'diet plan',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red[400],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NextScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Text(
              "8:00–9:00 AM",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red[500],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the list of meal cards
  Widget _buildMealList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        children: _breakfastMeals.asMap().entries.map((entry) {
          final int index = entry.key;
          final MealItem meal = entry.value;

          return MealCards(
            key: Key(meal.id), // Use the meal ID as the key
            meal: meal,
            number: (index + 1).toString(),
          );
        }).toList(),
      ),
    );
  }

  /// Builds the red "Macros goal" summary box
  Widget _buildMacrosGoal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: _macrosRed,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Meal Macros goal",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "3 items",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "291 kcal",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Calories",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the "View full plan" link at the bottom
  Widget _buildViewPlanLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DietPlanScreen()),
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(35.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "View full plan",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
