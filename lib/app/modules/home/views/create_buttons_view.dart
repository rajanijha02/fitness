import 'package:fitness/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateButtonsView extends GetView<HomeController> {
  const CreateButtonsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                controller.changeCreateExerciseState();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Text(
                  'CREATE EXERCISE',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.changeCreateProgramState();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Text(
                  'CREATE PROGRAM',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
