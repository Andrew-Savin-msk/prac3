import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 20),
            const Center(child: Text('Андрей Савин', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            const SizedBox(height: 40),
            const Text('Статистика', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Всего тренировок'),
              trailing: Text('5'),
            ),
            const ListTile(
              leading: Icon(Icons.timer),
              title: Text('Общее время'),
              trailing: Text('45 мин'),
            ),
          ],
        ),
      ),
    );
  }
}
