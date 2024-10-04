import 'package:flutter/material.dart';

class DriverInfo extends StatelessWidget {
  final String? profileImageUrl;
  final String? phoneNumber;
  final String fullName;

  const DriverInfo({
    super.key,
    this.profileImageUrl,
    this.phoneNumber,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8), // Add some padding
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 30, // Adjust the size of the avatar
            backgroundImage:
                profileImageUrl != null ? NetworkImage(profileImageUrl!) : null,
            child: profileImageUrl == null
                ? const Icon(Icons.person, size: 30) // Default icon if no image
                : null,
          ),
          const SizedBox(width: 16), // Add space between image and text
          // Full name and phone number column
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align texts to the left
            children: [
              // Full Name
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Phone number (optional)
              if (phoneNumber != null)
                Text(
                  phoneNumber!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey, // Make phone number text a bit lighter
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
