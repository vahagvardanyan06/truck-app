import 'package:flutter/material.dart';
import 'package:truck_app/pages/productDetails/components/feature_item.dart';

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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Features',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              FeatureItem(
                icon: Icons.access_time,
                label: 'Time',
                value: time,
              ),
              const SizedBox(height: 14),
              FeatureItem(
                icon: Icons.speed,
                label: 'Speed',
                value: speed,
              ),
              const SizedBox(height: 14),
              FeatureItem(
                icon: isLocked ? Icons.lock : Icons.lock_open,
                label: 'Lock Status',
                value: isLocked ? 'Locked' : 'Unlocked',
                iconColor: isLocked ? Colors.red : Colors.green,
              ),
              if (oil != null) const SizedBox(height: 14),
              if (oil != null)
                FeatureItem(
                  icon: Icons.local_gas_station,
                  label: 'Oil Level',
                  value: oil!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
