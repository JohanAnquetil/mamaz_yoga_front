class SubscriptionPlan {
  final String id;
  final String name;
  final String description;
  final String amount;
  final String status;
  final String role;
  final String createdDate;
  final String expiryDate;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.status,
    required this.role,
    required this.createdDate,
    required this.expiryDate,
  });

  // Factory to create a SubscriptionPlan from the detailed subscription info JSON
  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['arm_subscription_plan_id'],
      name: json['arm_subscription_plan_name'],
      description: json['arm_subscription_plan_description'],
      amount: json['arm_subscription_plan_amount'],
      status: json['arm_subscription_plan_status'],
      role: json['arm_subscription_plan_role'],
      createdDate: json['arm_subscription_plan_created_date'],
      expiryDate: json['arm_subscription_plan_options']['expiry_date'],
    );
  }
}
