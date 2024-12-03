import 'package:mamaz_yoga/domain/user/entities/user.dart';

class UserModel {
  final String  gender;
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

  UserModel({
    String? gender,
    required this.email,
    String? firstName,
    String? lastName,
    String? displayName,
    required this.hasAPremiumSubscription,
    String? surName,
    String? subscriptionName,
    String? subscriptionDescription,
    String? subscriptionStartedDate,
    String? subscriptionEndDate,
  })  : gender = gender ?? "",
        firstName = firstName ?? "",
        lastName = lastName ?? "",
        displayName = displayName ?? "",
        surName = surName ?? "",
        subscriptionName = subscriptionName ?? "",
        subscriptionDescription = subscriptionDescription ?? "",
        subscriptionStartedDate = subscriptionStartedDate ?? "",
        subscriptionEndDate = subscriptionEndDate ?? "";

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      gender: json['genre'],
      email: json['email'],
      firstName: json['prenom'],
      lastName: json['nom'],
      displayName: json['nom_a_afficher'],
      surName: json['surnom'],
      hasAPremiumSubscription: json['has_active_premium_subscription'],
      subscriptionName: json['plan_actuel']['arm_current_plan_detail']
          ['arm_subscription_plan_name'],
      subscriptionDescription: json['plan_actuel']['arm_current_plan_detail']
          ['arm_subscription_plan_description'],
      subscriptionEndDate: json['plan_actuel']['arm_expire_plan'],
      subscriptionStartedDate: json['plan_actuel']['arm_start_plan'],
    );
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      gender: gender,
      email: email,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
      hasAPremiumSubscription: hasAPremiumSubscription,
      surName: surName,
      subscriptionName: subscriptionName,
      subscriptionDescription: subscriptionDescription,
      subscriptionStartedDate: subscriptionStartedDate,
      subscriptionEndDate: subscriptionEndDate,
    );
  }
}
