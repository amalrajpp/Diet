import 'package:flutter/material.dart';

// --- MODIFIED: Converted to StatefulWidget ---
class HealthResultScreen extends StatefulWidget {
  const HealthResultScreen({super.key});

  @override
  State<HealthResultScreen> createState() => _HealthResultScreenState();
}

class _HealthResultScreenState extends State<HealthResultScreen> {
  // --- ADDED: State variable to track selection ---
  String _selectedOrgan = 'Gut';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // --- 1. Background Image ---
            Positioned(
              top: 70,
              right: -70,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  'assets/body_diagram.png',
                  height: 460,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            // --- 2. Main Content (Now Scrollable) ---
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -- Header --
                    _buildHeader(),
                    const SizedBox(height: 40),

                    // -- Metabolism Card --
                    _buildMetabolismCard(),

                    const SizedBox(height: 20),

                    // -- Organ Selector --
                    _buildOrganSelector(),
                    const SizedBox(height: 20),

                    // -- View Result Button --
                    _buildViewResultButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the "Today's Result" header section
  Widget _buildHeader() {
    // (This widget code is unchanged)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Result",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 18),
            const SizedBox(width: 8),
            Text(
              'Completed',
              style: TextStyle(
                color: Colors.green[700],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          '05 Jul, 12:30pm',
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
      ],
    );
  }

  /// Builds the main "Gut Fermentation" card
  Widget _buildMetabolismCard() {
    // (This widget code is unchanged)
    return Card(
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.grey.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 190,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gut Fermentation Metabolism',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Absorptive Metabolism Score',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const Text(
              '97%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              'Fermentative Metabolism Score',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const Text(
              '3%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Good',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.bar_chart, color: Colors.grey[500]),
                    const SizedBox(width: 12),
                    Icon(Icons.info_outline, color: Colors.grey[500]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the bottom organ selector
  Widget _buildOrganSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.grey[400]),

          // --- MODIFIED: Wrapped chips in GestureDetector to update state ---
          GestureDetector(
            onTap: () => setState(() => _selectedOrgan = 'Gut'),
            child: _buildOrganChip(
              'Gut',
              Icons.bubble_chart_outlined,
              _selectedOrgan == 'Gut', // Use state variable
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _selectedOrgan = 'Pancreas'),
            child: _buildOrganChip(
              'Pancreas',
              Icons.wb_sunny_outlined,
              _selectedOrgan == 'Pancreas', // Use state variable
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _selectedOrgan = 'Liver'),
            child: _buildOrganChip(
              'Liver',
              Icons.filter_drama_outlined,
              _selectedOrgan == 'Liver', // Use state variable
            ),
          ),

          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
        ],
      ),
    );
  }

  /// Helper widget for the organ chips in the selector
  Widget _buildOrganChip(String label, IconData icon, bool isSelected) {
    // (This widget code is unchanged)
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue[700] : Colors.grey[400],
            size: 20,
          ),
          if (isSelected) ...[
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Builds the "View test result" text button
  Widget _buildViewResultButton() {
    return Center(
      child: TextButton(
        // --- MODIFIED: Added SnackBar on press ---
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading test results...')),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View test result',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blue[700]),
          ],
        ),
      ),
    );
  }
}
