import '../../domain/entities/forget_password_entity.dart';

class ForgetPasswordModel extends ForgetPasswordEntity {
  ForgetPasswordModel({required super.message});

  factory ForgetPasswordModel.fromEntity(ForgetPasswordEntity entity) {
    return ForgetPasswordModel(message: entity.message);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      message: json['message'] ?? 'Password reset email sent successfully',
    );
  }
}

