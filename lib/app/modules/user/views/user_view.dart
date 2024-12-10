import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../user_form/views/user_form_view.dart';
import '../controllers/user_controller.dart';



// ignore: use_key_in_widget_constructors
class UserListView extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Get.to(() => UserFormView()),
          ),
        ],
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (userController.error.value.isNotEmpty) {
          return Center(child: Text('Error: ${userController.error.value}'));
        }

        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            User user = userController.users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => Get.to(() => UserFormView()),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => userController.deleteUser(user.id!),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}