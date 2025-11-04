import 'package:flutter/material.dart';
import 'package:health/diet_plan.dart';
import 'package:health/next_plan.dart';
import 'package:health/result_screen.dart';

// --- Main Dashboard Screen ---
class HealthDashboardScreen extends StatelessWidget {
  const HealthDashboardScreen({super.key});

  // --- Design Colors ---
  static const Color _backgroundColor = Color(0xFFFFF3E8);
  static const Color _headerIconColor = Color(0xFFF09A3C);
  static const Color _titleRed = Color(0xFFE85D4A);
  static const Color _macrosRed = Color(0xFFE85D4A);
  static const Color _mealCardBg = Color(0xFFFFFBF8);

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
                const SizedBox(height: 15), // Smaller
                _buildBreakfastTitle(context),
                const SizedBox(height: 15), // Smaller
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
      padding: const EdgeInsets.symmetric(
        horizontal: 26.0,
        vertical: 18.0,
      ), // Smaller
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi sparsh",
                style: TextStyle(
                  fontSize: 12, // Smaller
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Good morning",
                style: TextStyle(
                  fontSize: 22, // Smaller
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
              const SizedBox(width: 10), // Smaller
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
            fontSize: 26, // Smaller
            fontWeight: FontWeight.bold,
            color: _titleRed,
          ),
        ),
        const SizedBox(height: 6), // Smaller
        RichText(
          text: TextSpan(
            // Note: No general style here, we define it in the children
            children: <TextSpan>[
              TextSpan(
                text: 'As per your ',
                style: TextStyle(
                  fontSize: 16,
                  // This color is sampled from the "As per your" text
                  color: Colors.red[300],
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'diet plan',
                style: TextStyle(
                  fontSize: 16,
                  // This color is sampled from the "diet plan" text
                  color: Colors.red[400],
                  fontWeight: FontWeight.w700, // Bolder
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15), // Smaller
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NextScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 5,
            ), // Smaller
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
                fontSize: 14, // Smaller
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10), // Smaller
      child: Column(
        children: [
          MealCards(
            icon: Icons.restaurant_menu_outlined,
            iconColor: Color(0xFFEF6C00), // Colors.orange.shade700
            iconBackgroundColor: Color(0xFFFFF3E0), // Colors.orange.shade50
            number: "1",
            title: "Moong Dal Chilla",
            subtitle: "2 ladles (60g each)",
            calories: "220 kcal",
          ),

          MealCards(
            icon: Icons.local_drink_outlined,
            iconColor: Color(0xFF6A1B9A), // Colors.purple.shade700
            iconBackgroundColor: Color(0xFFF3E5F5), // Colors.purple.shade50
            number: "2",
            title: "Boiled Egg",
            subtitle: "1 egg (50g)",
            calories: "68 kcal",
          ),

          MealCards(
            icon: Icons.local_cafe_outlined,
            iconColor: Color(0xFF2E7D32), // Colors.green.shade700
            iconBackgroundColor: Color(0xFFE8F5E9), // Colors.green.shade50
            number: "3",
            title: "Green Tea (No Sugar)",
            subtitle: "1 cup (200ml)",
            calories: "3 kcal",
          ),
        ],
      ),
    );
  }

  /// Builds the red "Macros goal" summary box
  Widget _buildMacrosGoal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0), // Smaller
      padding: const EdgeInsets.all(20), // Smaller
      decoration: const BoxDecoration(
        color: _macrosRed,
        borderRadius: BorderRadius.all(Radius.circular(25)), // Smaller
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
                  fontSize: 13, // Smaller
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "3 items",
                style: TextStyle(
                  fontSize: 20, // Smaller
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
                  fontSize: 18, // Smaller
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Calories",
                style: TextStyle(
                  fontSize: 18, // Smaller
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
        padding: EdgeInsets.all(35.0), // Smaller
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "View full plan",
              style: TextStyle(
                fontSize: 15, // Smaller
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward,
              size: 16, // Smaller
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class MealCards extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String number;
  final String title;
  final String subtitle;
  final String calories;

  const MealCards({
    super.key,
    required this.icon,
    required this.number,
    required this.title,
    required this.subtitle,
    required this.calories,
    required this.iconColor,
    required this.iconBackgroundColor,
  });

  // Define a static color for the meal card background.
  static const Color _mealCardBg = Color(0xFFFFFBF8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 28),
      decoration: BoxDecoration(
        color: _mealCardBg, // Use the defined background color
        borderRadius: BorderRadius.only(
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
            _mealCardBg.withOpacity(0.6), // Slightly transparent to create fade
            _mealCardBg.withOpacity(0.0), // Fully transparent at the bottom
          ],
          stops: const [0.0, 0.8, 1.0], // Control the gradient stops
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconBackgroundColor,
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 10),
          Text(
            number,
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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      subtitle,
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
          Text(
            calories,
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
