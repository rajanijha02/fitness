import 'package:fitness/app/modules/home/views/exercise_form_view.dart';
import 'package:fitness/app/modules/home/views/item_list_view.dart';
import 'package:fitness/app/modules/home/views/program_form_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/person.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FIT',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 1),
                Text(
                  'NESS',
                  style: GoogleFonts.poppins(
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            Container()
          ],
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.createProgram.isTrue
            ? ProgramFormView()
            : controller.createExercise.isTrue
                ? ExerciseFormView()
                : ItemListView(),
      ),
    );
  }
}
