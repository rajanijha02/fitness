import 'dart:io';

import 'package:fitness/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseFormView extends GetView<HomeController> {
  const ExerciseFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create Exercise',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.changeCreateExerciseState();
                },
                icon: const Icon(Icons.clear),
              )
            ],
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: TextField(
            controller: controller.nameController,
            decoration: const InputDecoration(
              hintText: 'Exercise Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: TextField(
            controller: controller.descriptionController,
            expands: true,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Exercise Description',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            controller.imagePicker();
          },
          child: Obx(
            () => Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              alignment: Alignment.center,
              child: controller.imageUrl.value != "N/A"
                  ? Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: FileImage(
                                File(controller.imageUrl.value),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.imageUrl.value.split('/').last,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.imageUrl.value = "N/A";
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.indigo.shade400,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.clear,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  : Text(
                      "PICK IMAGE",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            controller.createExerciseLogic();
          },
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 50,
              width: controller.isCreating.isTrue ? 50 : Get.width,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: controller.isCreating.isTrue
                    ? Colors.white
                    : Colors.indigo.shade500,
              ),
              alignment: Alignment.center,
              child: controller.isCreating.isTrue
                  ? const CircularProgressIndicator()
                  : Text(
                      'CREATE EXERCISE',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
