class DriverInfoType {
  final String fullName;
  final String? profileImageUrl;
  final String? phoneNumber;

  DriverInfoType(
      {required this.fullName, this.phoneNumber, this.profileImageUrl});
}

class CardItem {
  final String title;
  final String imageUrl;
  final String location;
  final String speed;
  final bool isLocked;
  final String time;
  final String id;
  final DriverInfoType driverInfo;

  CardItem(
      {required this.title,
      required this.imageUrl,
      required this.location,
      required this.speed,
      required this.isLocked,
      required this.time,
      required this.id,
      required this.driverInfo});
}
