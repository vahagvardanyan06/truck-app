import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  final String time;
  final String speed;
  final bool isLocked;
  final String? oil;

  const Features({
    super.key,
    required this.time,
    required this.speed,
    required this.isLocked,
    this.oil,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0), // You can adjust this if needed
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the left
          children: [
            _FeatureItem(
              icon: Icons.access_time,
              value: time,
            ),
            const SizedBox(width: 16),
            _FeatureItem(
              icon: Icons.speed,
              value: speed,
            ),
            const SizedBox(width: 16),
            _FeatureItem(
              icon: isLocked ? Icons.lock : Icons.lock_open,
              value: isLocked ? 'Locked' : 'Unlocked',
              iconColor: isLocked ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 16),
            if (oil != null)
              _FeatureItem(
                icon: Icons.local_gas_station,
                value: oil!,
              ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color? iconColor; // Added this to customize icon color

  // Set fixed width and height for the feature item
  static const double itemWidth = 85; // Set a fixed width
  static const double itemHeight = 85; // Set a fixed height

  const _FeatureItem({
    Key? key,
    required this.icon,
    required this.value,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth, // Fixed width
      height: itemHeight, // Fixed height
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center content vertically
        children: [
          Icon(icon, size: 24.0, color: iconColor), // Display icon
          const SizedBox(height: 4), // Space between icon and value text
          Text(
            value,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center, // Center text
          ),
          const Divider(height: 4, thickness: 1), // Divider below the item
        ],
      ),
    );
  }
}
