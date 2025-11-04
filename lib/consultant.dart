import 'package:flutter/material.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- MODIFIED: Passed context ---
                _buildConsultantSection(context),
                const SizedBox(height: 20),
                // --- MODIFIED: Passed context ---
                _buildActionButtons(context),
                const SizedBox(height: 20),
                _buildAppointmentInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- MODIFIED: Added context ---
  Widget _buildConsultantSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your consultant',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Color(0xFFE0E0E0),
              child: Icon(Icons.person, size: 30, color: Color(0xFF9E9E9E)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dt. Manoranjan',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dietitian • 11 years of experience',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  // --- MODIFIED: Wrapped "More Info" in InkWell ---
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Showing more info...')),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min, // Keep row tight
                      children: [
                        Text(
                          'More Info',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- MODIFIED: Added context ---
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          // --- MODIFIED: Added SnackBar ---
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Opening messenger...')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Send message', style: TextStyle(fontSize: 15)),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          // --- MODIFIED: Added SnackBar ---
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Showing appointments...')),
            );
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blue,
            side: const BorderSide(color: Colors.blue),
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upcoming Appointments', style: TextStyle(fontSize: 15)),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentInfo() {
    // (This widget code is unchanged)
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
            height: 1.4,
          ),
          children: [
            const TextSpan(text: 'Your appointment is on '),
            const TextSpan(
              text: '25 July 2026 at 03:00 PM.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: ' Please be on time.'),
          ],
        ),
      ),
    );
  }
}
