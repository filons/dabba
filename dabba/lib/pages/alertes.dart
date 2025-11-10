import 'package:flutter/material.dart';

class MyAlertesPage extends StatefulWidget {
  const MyAlertesPage({super.key});

  @override
  State<MyAlertesPage> createState() => _MyAlertesPageState();
}

class _MyAlertesPageState extends State<MyAlertesPage> {
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
              backgroundColor: theme.colorScheme.secondaryContainer,
              child: Icon(
                Icons.notifications_active_rounded,
                color: theme.colorScheme.onSecondaryContainer,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Aucune alerte définie',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Créez des seuils pour être averti avant les ruptures et anomalies.',
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
                    content: Text('Action à implémenter: Créer une alerte'),
                  ),
                );
              },
              icon: const Icon(Icons.add_alert_rounded),
              label: const Text('Créer une alerte'),
            ),
          ],
        ),
      ),
    );
  }
}
