import 'dart:io';

import 'package:fitness/app/models/program_model.dart';
import 'package:fitness/app/modules/home/controllers/home_controller.dart';
import 'package:fitness/app/modules/home/views/create_buttons_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemListView extends GetView<HomeController> {
  const ItemListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CreateButtonsView(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors.grey[200],
                  backgroundColor: Colors.grey[200],
                  title: Text(
                    controller.programs[index].name,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.label,
                    color: Colors.indigo.shade500,
                  ),
                  subtitle: Text(
                    controller.programs[index].description,
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  children: [
                    AddExerciseToProgramWidget(
                      controller: controller,
                      program: controller.programs[index],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text('Exercises',
                          style: TextStyle(fontSize: 20)),
                    ),
                    Obx(
                      () => SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemBuilder: (context, i) {
                            return controller.exercises[i].programId ==
                                    controller.programs[index].id
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.exercises[i].name,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 17,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              controller.removeLoadedExercise(
                                                controller.exercises[i].id,
                                                controller.programs[index].id,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.clear,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          File(controller.exercises[i].image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      subtitle: Text(
                                        controller.programs[index].description,
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          },
                          itemCount: controller.exercises.length,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: controller.programs.length,
          ),
        )
      ],
    );
  }
}

class AddExerciseToProgramWidget extends StatelessWidget {
  AddExerciseToProgramWidget({
    super.key,
    required this.controller,
    required this.program,
  });
  HomeController controller;
  Program program;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonFormField(
                  hint: const Text("SELECT EXERCISE"),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  items: controller.globalExercises.value
                      .map(
                        (element) => DropdownMenuItem(
                          value: element.id,
                          child: Text(element.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.setSelectedExercise(value.toString());
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                controller.addExerciseToProgram(
                  controller.selectedExercise.value,
                  program.id,
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Text(
                  'ADD',
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
