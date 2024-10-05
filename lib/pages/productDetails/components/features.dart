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
              _FeatureItem(
                icon: Icons.access_time,
                label: 'Time',
                value: time,
              ),
              const SizedBox(height: 12),
              _FeatureItem(
                icon: Icons.speed,
                label: 'Speed',
                value: speed,
              ),
              const SizedBox(height: 12),
              _FeatureItem(
                icon: isLocked ? Icons.lock : Icons.lock_open,
                label: 'Lock Status',
                value: isLocked ? 'Locked' : 'Unlocked',
                iconColor: isLocked ? Colors.red : Colors.green,
              ),
              if (oil != null) const SizedBox(height: 12),
              if (oil != null)
                _FeatureItem(
                  icon: Icons.local_gas_station,
                  label: 'Oil Level',
                  value: oil!,
                ),
              const SizedBox(height: 20),
              _FeatureItem(
                icon: Icons.speed,
                label: 'Speed',
                value: speed,
              ),
              const SizedBox(height: 12),
              _FeatureItem(
                icon: Icons.speed,
                label: 'Speed',
                value: speed,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
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
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 24.0, color: iconColor ?? Colors.black),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
