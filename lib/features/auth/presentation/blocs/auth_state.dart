import 'package:flutter/material.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterLoadedState extends AuthState {
  final String successMessage;
  RegisterLoadedState({required this.successMessage});
}

class RegisterErrorState extends AuthState {
  final String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
