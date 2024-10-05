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
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Vehicle Features',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          _FeatureItem(
            icon: Icons.access_time,
            label: 'Time',
            value: time,
          ),
          const SizedBox(height: 16),
          _FeatureItem(
            icon: Icons.speed,
            label: 'Speed',
            value: speed,
          ),
          const SizedBox(height: 16),
          _FeatureItem(
            icon: isLocked ? Icons.lock : Icons.lock_open,
            label: 'Lock Status',
            value: isLocked ? 'Locked' : 'Unlocked',
            iconColor: isLocked ? Colors.green : Colors.red,
          ),
          if (oil != null) const SizedBox(height: 16),
          if (oil != null)
            _FeatureItem(
              icon: Icons.local_gas_station,
              label: 'Oil Level',
              value: oil!,
            ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;

  const _FeatureItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(icon, size: 20.0, color: iconColor ?? Colors.black54),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
