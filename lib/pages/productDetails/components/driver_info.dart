import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegex =
        RegExp(r'^\+374[0-9]{8}$'); // Adjust according to your format needs
    return phoneRegex.hasMatch(phoneNumber);
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    if (isValidPhoneNumber(phoneNumber)) {
      final Uri url = Uri(scheme: 'tel', path: phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        print('Could not launch $url');
      }
    } else {
      print('Invalid phone number format: $phoneNumber');
    }
  }

  Future<void> _sendMessage(String phoneNumber) async {
    final Uri url = Uri(scheme: 'sms', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 229, 225, 225),
                radius: 30,
                backgroundImage: profileImageUrl != null
                    ? NetworkImage(profileImageUrl!)
                    : null,
                child: profileImageUrl == null
                    ? const Icon(Icons.person, size: 40)
                    : null,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (phoneNumber != null)
                    Text(
                      phoneNumber!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.message_outlined),
                onPressed: () {
                  if (phoneNumber != null) {
                    _sendMessage(phoneNumber!);
                  } else {
                    print("Phone number is not available");
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () {
                  if (phoneNumber != null) {
                    _makePhoneCall(phoneNumber!);
                  } else {
                    print("Phone number is not available");
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
