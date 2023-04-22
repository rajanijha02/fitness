import 'package:fitness/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramFormView extends GetView<HomeController> {
  const ProgramFormView({Key? key}) : super(key: key);
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
                'Create Program',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.changeCreateProgramState();
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
              hintText: 'Program Name',
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
              hintText: 'Program Description',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            controller.createProgramLogic();
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
                      'CREATE PROGRAM',
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
