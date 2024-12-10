import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../services/api_service.dart';


class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchAllUsers();
  }

  void fetchAllUsers() async {
    try {
      isLoading.value = true;
      users.value = await _apiService.fetchUsers();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  void createUser(User user) async {
    try {
      isLoading.value = true;
      User newUser = await _apiService.createUser(user);
      users.add(newUser);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  void updateUser(User user) async {
    try {
      isLoading.value = true;
      User updatedUser = await _apiService.updateUser(user);
      int index = users.indexWhere((u) => u.id == updatedUser.id);
      if (index != -1) {
        users[index] = updatedUser;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  void deleteUser(int id) async {
    try {
      isLoading.value = true;
      await _apiService.deleteUser(id);
      users.removeWhere((user) => user.id == id);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}