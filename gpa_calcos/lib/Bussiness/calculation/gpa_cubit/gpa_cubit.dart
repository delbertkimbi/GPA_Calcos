import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calcos/Data/models/subjects.dart';

part 'gpa_state.dart';

class GpaCubit extends Cubit<List<Subject>> {
  GpaCubit() : super([]);
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

  List<double> calculateGPA() {
    double totalCredits = 0;
    double totalGradePoints = 0;

    for (var subject in state) {
      totalCredits += subject.creditValue;
      totalGradePoints +=
          _calculateGradePoints(subject.grade) * subject.creditValue;
    }

    if (totalCredits > 0) {
      return [totalGradePoints / totalCredits, totalGradePoints, totalCredits];
    } else {
      return [0.0, 0.0, 0.0];
    }
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
        return 1.0;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return -1;
    }
  }
}
