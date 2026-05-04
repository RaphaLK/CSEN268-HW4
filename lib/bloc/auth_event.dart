part of 'auth_bloc.dart';

abstract class AuthEvent {}

class Login extends AuthEvent {}

class Logout extends AuthEvent {}