import 'package:movies_project/features/auth/forget_password_screen/domain/entities/forget_password_entity.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordEntity data;
  ForgetPasswordSuccess(this.data);
}

class ForgetPasswordError extends ForgetPasswordState {
  final String message;
  ForgetPasswordError(this.message);
}

