import 'package:flutter/material.dart';
import '../models.dart';
import 'exercise_list_screen.dart';
import 'profile_screen.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workout1 = Workout(
      name: 'Утренняя зарядка',
      category: 'Для начинающих',
      exercises: [
        Exercise(name: 'Jumping Jacks', description: 'Простое кардио-упражнение для разогрева.', durationInSeconds: 60),
        Exercise(name: 'Приседания', description: 'Базовое упражнение для ног и ягодиц.', durationInSeconds: 45),
        Exercise(name: 'Планка', description: 'Держите планку на локтях.', durationInSeconds: 30),
      ],
    );

    final workout2 = Workout(
      name: 'Силовая тренировка',
      category: 'Продвинутый уровень',
      exercises: [
        Exercise(name: 'Отжимания', description: 'Классические отжимания.', durationInSeconds: 60),
        Exercise(name: 'Подтягивания', description: 'Подтягивания на турнике.', durationInSeconds: 60),
        Exercise(name: 'Берпи', description: 'Комплексное упражнение.', durationInSeconds: 45),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Программы тренировок'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWorkoutCard(context, workout1),
            _buildWorkoutCard(context, workout2),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(BuildContext context, Workout workout) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseListScreen(workout: workout),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.deepPurple[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepPurple, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              workout.category,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.deepPurple),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
