import 'package:flutter/material.dart';

// --- ADDED: Define spacing and padding as constants for reusability ---
const double _kPagePadding = 16.0;
const double _kSectionSpacing = 20.0;
const double _kItemSpacing = 12.0;

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // --- MODIFIED: Use theme color for background ---
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          // --- MODIFIED: Use constant for padding ---
          child: Padding(
            padding: const EdgeInsets.all(_kPagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildConsultantSection(context),
                const SizedBox(height: _kSectionSpacing),
                _buildActionButtons(context),
                const SizedBox(height: _kSectionSpacing),
                _buildAppointmentInfo(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConsultantSection(BuildContext context) {
    // --- MODIFIED: Use theme for text styles and colors ---
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your consultant',
          // --- MODIFIED: Use semantic theme style ---
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: _kItemSpacing),
        Row(
          children: [
            CircleAvatar(
              radius: 35,
              // --- MODIFIED: Use semantic theme colors ---
              backgroundColor: colorScheme.secondaryContainer,
              child: Icon(
                Icons.person,
                size: 30,
                color: colorScheme.onSecondaryContainer,
              ),
            ),
            const SizedBox(width: _kItemSpacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dt. Manoranjan',
                    // --- MODIFIED: Use semantic theme style ---
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dietitian • 11 years of experience',
                    // --- MODIFIED: Use semantic theme style ---
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
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
                          // --- MODIFIED: Use semantic theme style and color ---
                          style: textTheme.labelLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          // --- MODIFIED: Use semantic theme color ---
                          color: colorScheme.primary,
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

  Widget _buildActionButtons(BuildContext context) {
    // --- ADDED: Define a base style for buttons to reduce repetition ---
    final ButtonStyle baseButtonStyle = ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      elevation: MaterialStateProperty.all(0),
    );

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Opening messenger...')),
            );
          },
          // --- MODIFIED: Merge base style with specific styles ---
          style: baseButtonStyle.merge(
            ElevatedButton.styleFrom(
              // Let the theme handle default blue/white
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
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
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Showing appointments...')),
            );
          },
          // --- MODIFIED: Merge base style with specific styles ---
          style: baseButtonStyle.merge(
            OutlinedButton.styleFrom(
              // Let the theme handle default colors and border
              foregroundColor: Theme.of(context).colorScheme.primary,
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
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

  Widget _buildAppointmentInfo(BuildContext context) {
    // --- MODIFIED: Use theme for styles and colors ---
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(_kItemSpacing),
      decoration: BoxDecoration(
        // --- MODIFIED: Use theme color ---
        color: colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text.rich(
        TextSpan(
          // --- MODIFIED: Use theme style ---
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
            height: 1.4,
          ),
          children: [
            const TextSpan(text: 'Your appointment is on '),
            TextSpan(
              text: '25 July 2026 at 03:00 PM.',
              // --- MODIFIED: Inherit style and just add weight ---
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: ' Please be on time.'),
          ],
        ),
      ),
    );
  }
}
