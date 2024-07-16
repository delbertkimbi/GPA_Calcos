import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calcos/Data/models/subjects.dart';

part 'subject_info_cubit_state.dart';

class SubjectInfoCubit extends Cubit<List<Subject>> {
  SubjectInfoCubit() : super([]);
  addSubject(String name, String grade, double creditValue) {
    final subject = Subject(
      name: name,
      grade: grade,
      creditValue: creditValue,
    );
    state.add(subject);
    emit([...state]);
    calculateGPA();
  }

  void deleteSubject(int index) {
    // emit([...state.sublist(0, index), ...state.sublist(index + 1)]);
    final newState = List<Subject>.from(state)..removeAt(index);
    emit(newState);
  }

  double _calculateGradePoints(String grade) {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B+':
        return 3.5;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.5;
      case 'C':
        return 2.0;
      case 'D+':
        return 1.5;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
<<<<<<< HEAD
        return 0;
=======
        return 0.0;
>>>>>>> gpa_goals
    }
  }

  double calculateGPA() {
    double gpa;
    double totalCredits = 0;
    double totalGradePoints = 0;

    for (var subject in state) {
      totalCredits += subject.creditValue;
      totalGradePoints +=
<<<<<<< HEAD
          _calculateGradePoints(subject.grade!) * subject.creditValue;
=======
          _calculateGradePoints(subject.grade) * subject.creditValue;
>>>>>>> gpa_goals
    }

    if (totalCredits > 0) {
      gpa = totalGradePoints / totalCredits;

      return gpa;
    } else {
      return 0.0;
    }
  }

  String totalGpaValueGrade() {
    switch (calculateGPA()) {
      case 4.0:
        return 'A';
<<<<<<< HEAD
      case 3.5:
        return 'B+';
      case 3.0:
        return 'B';
      case 2.5:
        return 'C+';
      case 2.0:
        return 'C';
      case 1.5:
        return 'D+';
      case 1.0:
        return 'D';
      case 0.0:
=======
      case >= 3.5 && < 4.0:
        return 'B+';
      case >= 3.0 && < 3.5:
        return 'B';
      case >= 2.5 && < 3.0:
        return 'C+';
      case >= 2.0 && < 2.5:
        return 'C';
      case >= 1.5 && < 2.0:
        return 'D+';
      case >= 1.0 && < 2.0:
        return 'D';
      case >= 0.0 && < 1.0:
>>>>>>> gpa_goals
        return 'F';
      default:
        return '';
    }
  }
}
