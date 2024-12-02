import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../widgets/progress_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameState(),
      child: Consumer<GameState>(
        builder: (context, gameState, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Bichinho Virtual Carente')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProgressBar(
                    value: gameState.hunger,
                    label: 'Fome',
                    color: Colors.red,
                  ),
                  const SizedBox(height: 20),
                  ProgressBar(
                    value: gameState.fun,
                    label: 'Diversão',
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  ProgressBar(
                    value: gameState.sleep,
                    label: 'Sono',
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.fastfood, size: 36, color: Colors.red),
                        onPressed: () => gameState.feed(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.sports_soccer, size: 36, color: Colors.blue),
                        onPressed: () => gameState.play(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.bed, size: 36, color: Colors.grey),
                        onPressed: () {
                          gameState.sleepIncrement();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
