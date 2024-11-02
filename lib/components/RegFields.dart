import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:stock_sync/controllers/userControllers/registerController.dart";

class RegFields extends StatefulWidget {
  const RegFields({super.key});

  @override
  State<RegFields> createState() => _RegFieldsState();
}

class _RegFieldsState extends State<RegFields> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Registercontroller());

    return Column(
      children: [
        // text field to add firstname field
        TextFormField(
          // controller: controller.firstName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
          controller: controller.firstName,
          decoration: InputDecoration(
            labelText: "Firstname",
            hintText: "Enter Your First Name",
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 50),
        // text field to add lastname field

        TextFormField(
          // controller: controller.lastName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
          controller: controller.lastName,
          decoration: InputDecoration(
            labelText: "Last Name",
            hintText: "Enter your Last Name",
            prefixIcon: const Icon(Icons.person_2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 50),
        TextFormField(
          // controller: controller.email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },

          controller: controller.email,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter Your Email",
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 50),

        TextFormField(
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          controller: controller.password,
          // controller: controller.password,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter Your Password",
            prefixIcon: const Icon(Icons.password),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 50),
      ],
    );
  }
}
