import 'package:flutter/material.dart';
import 'dart:async';
import '../models.dart';
import 'workout_summary_screen.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final List<Exercise> exercises;
  final int currentIndex;

  const ExerciseDetailScreen({super.key, required this.exercises, required this.currentIndex});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  Timer? _timer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    final currentExercise = widget.exercises[widget.currentIndex];
    _remainingSeconds = currentExercise.durationInSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _timer?.cancel();
        _goToNextExercise();
      }
    });
  }

  void _goToNextExercise() {
    if (widget.currentIndex < widget.exercises.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseDetailScreen(
            exercises: widget.exercises,
            currentIndex: widget.currentIndex + 1,
          ),
        ),
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WorkoutSummaryScreen()),
            (route) => route.isFirst,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentExercise = widget.exercises[widget.currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(currentExercise.name),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Упражнение ${widget.currentIndex + 1}/${widget.exercises.length}',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            Text(currentExercise.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            Text('$_remainingSeconds',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold)),
            const Text('секунд осталось'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _goToNextExercise,
                child: const Text('Пропустить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
