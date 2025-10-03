class Exercise {
  final String name;
  final String description;
  final int durationInSeconds;

  Exercise({
    required this.name,
    required this.description,
    required this.durationInSeconds,
  });
}

class Workout {
  final String name;
  final String category;
  final List<Exercise> exercises;

  Workout({
    required this.name,
    required this.category,
    required this.exercises,
  });
}
