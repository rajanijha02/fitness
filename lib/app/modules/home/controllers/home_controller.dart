import 'package:fitness/app/models/exerices_model.dart';
import 'package:fitness/app/models/program_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Program> programs = <Program>[].obs;
  RxList<Exercise> exercises = <Exercise>[].obs;
  RxList<GlobalExercise> globalExercises = <GlobalExercise>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxString imageUrl = 'N/A'.obs;
  RxString selectedExercise = 'N/A'.obs;

  RxBool createProgram = false.obs;
  RxBool isCreating = false.obs;
  RxBool createExercise = false.obs;

  changeCreateProgramState() {
    createProgram.value = !createProgram.value;
  }

  changeCreateExerciseState() {
    createExercise.value = !createExercise.value;
  }

  setSelectedExercise(String exercise) {
    selectedExercise.value = exercise;
  }

  createProgramLogic() {
    if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill all the fields');
      return;
    }

    isCreating.value = true;
    Future.delayed(
      const Duration(seconds: 2),
      () {
        programs.add(Program(
          id: getRandomId(),
          name: nameController.text,
          description: descriptionController.text,
        ));
        nameController.clear();
        descriptionController.clear();
        isCreating.value = false;
        Fluttertoast.showToast(msg: 'Program Created');
      },
    );
  }

  createExerciseLogic() {
    if (nameController.text.isEmpty || descriptionController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill all the fields');
      return;
    }

    isCreating.value = true;
    Future.delayed(
      const Duration(seconds: 2),
      () {
        globalExercises.add(
          GlobalExercise(
            id: getRandomId(),
            name: nameController.text,
            image: imageUrl.value,
            description: descriptionController.text,
          ),
        );
        nameController.clear();
        descriptionController.clear();
        imageUrl.value = "N/A";
        isCreating.value = false;
        Fluttertoast.showToast(msg: 'Exercise Created');
      },
    );
  }

  getRandomId() {
    return const Uuid().v4();
  }

  // Create image picker function using image_picker package
  imagePicker() {
    ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        imageUrl.value = value.path;
      } else {
        Fluttertoast.showToast(msg: 'No image selected');
      }
    }).catchError((error) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  addExerciseToProgram(String exerciseId, String programId) {
    for (Exercise exercise in exercises) {
      if (exercise.programId == programId && exercise.id == exerciseId) {
        Fluttertoast.showToast(msg: 'Exercise already added to this program');
        return;
      }
    }

    for (Program program in programs) {
      if (program.id == programId) {
        for (GlobalExercise globalExercise in globalExercises) {
          if (globalExercise.id == exerciseId) {
            Exercise exercise = Exercise(
              id: globalExercise.id,
              name: globalExercise.name,
              image: globalExercise.image,
              description: globalExercise.description,
              programId: programId,
            );
            exercises.add(exercise);
            Fluttertoast.showToast(msg: 'Exercise added to program');
            return;
          }
        }
      }
    }
  }

  removeLoadedExercise(String exerciseId, String programId) {
    for (Exercise exercise in exercises) {
      if (exercise.programId == programId && exercise.id == exerciseId) {
        exercises.remove(exercise);
        Fluttertoast.showToast(msg: 'Exercise removed from program');
        return;
      }
    }
  }
}
