import 'package:android_solution/src/auth/domain/models/user.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<String> createUser({
    required String username,
    required String email,
    required String password,
    required String phone,
  });
  Future<String> loginUser({
    required String email,
    required String password,
  });
  Future<List<User>> getUsers();
}
