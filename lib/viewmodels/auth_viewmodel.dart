import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AsyncValue<void>>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AsyncValue<void>> {
  AuthViewModel() : super(const AsyncValue.data(null));

  String? _userId;
  String? _errorMessage;

  Future<void> login(String email, String password) async {
    try {
      state = const AsyncValue.loading();
      // Implement your login logic here
      // Example: _userId = await FirebaseService.login(email, password);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      _errorMessage = error.toString();
    }
  }

  Future<void> register({required String username, required String email, required String password}) async {
    try {
      // Implement registration logic using FirebaseService
      // Example: _userId = await FirebaseService.register(username, email, password);
    } catch (e) {
      _errorMessage = e.toString();
    }
  }

  String? get userId => _userId;
  String? get errorMessage => _errorMessage;
}
