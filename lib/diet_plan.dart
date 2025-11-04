import 'package:flutter/material.dart';
import 'package:health/consultant.dart'; // Preserved your import

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 25,
                  left: 16,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 14),
                    Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            // --- MODIFIED: _buildPlanSummary is now tappable ---
                            _buildPlanSummary(context),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Divider(),
                            ),
                            _buildDailyTargetSection(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildGoalSection(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(),
                    ),
                    _buildApproachSection(),
                  ],
                ),
              ),
              const Divider(height: 1, thickness: 1),
              // --- MODIFIED: _buildFooterLink is now tappable ---
              _buildFooterLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(context) {
    // (This widget is unchanged and was already functional)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Diet Plan Strategy',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DietScreen()),
            );
          },
          child: Row(
            children: [
              Text(
                'As per ',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              Icon(
                Icons.account_circle_outlined,
                size: 16,
                color: Colors.blue[600],
              ),
              const SizedBox(width: 5),
              const Text(
                'Dt. Manoranjan',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Updated 05 Jul, 12:30pm',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ],
    );
  }

  // --- MODIFIED: Added context and GestureDetector ---
  Widget _buildPlanSummary(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '2-Week Plan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '05 July - 19 July',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // --- MODIFIED: Wrapped in GestureDetector ---
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Navigating to all plans...')),
            );
          },
          child: Row(
            children: [
              Text(
                'View all plans',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 12, color: Colors.blue[600]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDailyTargetSection() {
    // (This widget code is unchanged)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.track_changes_outlined,
              color: Colors.blue[600],
              size: 16,
            ),
            const SizedBox(width: 8),
            const Text(
              'Daily Target',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _buildStatCard('Calories', '1500', 'kcal/day'),
            const SizedBox(width: 12),
            _buildStatCard('Protein', '70', 'gram/day'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildStatCard('Fiber', '>25', 'gram/day'),
            const SizedBox(width: 12),
            _buildStatCard('Water', '3', 'Liters/day'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String unit) {
    // (This widget code is unchanged)
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(unit, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildGoalSection() {
    // (This widget code is unchanged)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.military_tech_outlined,
              color: Colors.blue[600],
              size: 16,
            ),
            const SizedBox(width: 8),
            const Text(
              'Goal',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Weight Loss',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '   |   ',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[400],
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'PCOS Management',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildApproachSection() {
    // (This widget code is unchanged)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.explore_outlined, color: Colors.blue[600], size: 14),
            const SizedBox(width: 8),
            const Text(
              'Approach',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            _buildChip('Low GI'),
            _buildChip('High Protein'),
            _buildChip('Balanced Fiber'),
            _buildChip('Calorie Deficit'),
          ],
        ),
      ],
    );
  }

  Widget _buildChip(String label) {
    // (This widget code is unchanged)
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // --- MODIFIED: Added context and SnackBar ---
  Widget _buildFooterLink(BuildContext context) {
    return InkWell(
      onTap: () {
        // --- MODIFIED: Handle tap ---
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Loading diet plan...')));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'View diet plan',
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.blue[600], size: 16),
          ],
        ),
      ),
    );
  }
}
