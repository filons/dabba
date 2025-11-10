import 'package:flutter/material.dart';

class MyCommunautePage extends StatefulWidget {
  const MyCommunautePage({super.key});

  @override
  State<MyCommunautePage> createState() => _MyCommunautePageState();
}

class _MyCommunautePageState extends State<MyCommunautePage> {
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
                Icons.people_alt_rounded,
                color: theme.colorScheme.onPrimaryContainer,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Rien pour le moment',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Rejoignez des discussions ou créez un nouveau sujet pour la communauté.',
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
                    content: Text('Action à implémenter: Nouveau sujet'),
                  ),
                );
              },
              icon: const Icon(Icons.add_comment_rounded),
              label: const Text('Nouveau sujet'),
            ),
          ],
        ),
      ),
    );
  }
}
