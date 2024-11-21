class UserEntity {
  final String gender;
  final String email;
  final String firstName;
  final String lastName;
  final String displayName;
  final bool hasAPremiumSubscription;
  final String surName;
  final String subscriptionName;
  final String subscriptionDescription;
  final String subscriptionStartedDate;
  final String subscriptionEndDate;

  UserEntity({
    required this.gender,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.hasAPremiumSubscription,
    required this.surName,
    required this.subscriptionName,
    required this.subscriptionDescription,
    required this.subscriptionStartedDate,
    required this.subscriptionEndDate,
  });
}
