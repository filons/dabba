import 'package:flutter/material.dart';

class MyStocksPage extends StatefulWidget {
  const MyStocksPage({super.key});

  @override
  State<MyStocksPage> createState() => _MyStocksPageState();
}

class _MyStocksPageState extends State<MyStocksPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(
                Icons.inventory_2_rounded,
                color: theme.colorScheme.onPrimaryContainer,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun stock configuré',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Ajoutez vos premiers articles pour suivre les entrées, sorties et ruptures.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Action à implémenter: Ajouter un article'),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Ajouter un article'),
            ),
          ],
        ),
      ),
    );
  }
}
