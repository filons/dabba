import 'package:flutter/material.dart';
import 'package:dabba/widgets/common_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BassinData {
  final int id;
  final double temperature;
  final int poissonsCount;
  final double phLevel;
  final double oxygenLevel;
  final List<double> temperatureHistory;
  final List<double> phHistory;
  final List<double> oxygenHistory;

  BassinData({
    required this.id,
    required this.temperature,
    required this.poissonsCount,
    required this.phLevel,
    required this.oxygenLevel,
    required this.temperatureHistory,
    required this.phHistory,
    required this.oxygenHistory,
  });
}

class AccueilContent extends StatelessWidget {
  const AccueilContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildBassinsList(),
          _buildWeatherCard(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vue d\'ensemble',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Surveillez vos bassins en temps réel',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onBackground.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 20),
          const BassinOverview(),
        ],
      ),
    );
  }

  Widget _buildBassinsList() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          BassinCard(bassinIndex: 1),
          SizedBox(width: 16),
          BassinCard(bassinIndex: 2),
          SizedBox(width: 16),
          BassinCard(bassinIndex: 3),
        ],
      ),
    );
  }

  Widget _buildWeatherCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Météo et Températures'),
          const SizedBox(height: 12),
          const WeatherCard(
            temperature: '28°C',
            humidity: '75%',
            condition: 'Ensoleillé',
            weatherIcon: FontAwesomeIcons.sun,
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: 'Températures des bassins'),
          const SizedBox(height: 12),
          Column(
            children: [
              PondTemperatureCard(
                pondName: 'Bassin 1',
                temperature: '24.5°C',
                lastUpdate: 'Il y a 5 min',
                temperatureColor: Colors.green,
              ),
              const SizedBox(height: 8),
              PondTemperatureCard(
                pondName: 'Bassin 2',
                temperature: '26.8°C',
                lastUpdate: 'Il y a 3 min',
                temperatureColor: Colors.orange,
              ),
              const SizedBox(height: 8),
              PondTemperatureCard(
                pondName: 'Bassin 3',
                temperature: '25.2°C',
                lastUpdate: 'Il y a 7 min',
                temperatureColor: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BassinOverview extends StatelessWidget {
  const BassinOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistiques globales',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatCard(
                icon: FontAwesomeIcons.fish,
                value: '1,250',
                label: 'Poissons',
              ),
              StatCard(
                icon: FontAwesomeIcons.water,
                value: '3',
                label: 'Bassins actifs',
              ),
              StatCard(
                icon: FontAwesomeIcons.bell,
                value: '0',
                label: 'Alertes',
                iconColor: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BassinCard extends StatelessWidget {
  final int bassinIndex;

  const BassinCard({super.key, required this.bassinIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Données simulées
    final data = BassinData(
      id: bassinIndex,
      temperature: 25 + bassinIndex.toDouble(),
      poissonsCount: 100 + (bassinIndex * 50),
      phLevel: 7.0 + (bassinIndex * 0.2),
      oxygenLevel: 85 + (bassinIndex * 2),
      temperatureHistory: List.generate(
        7,
        (i) => 25 + bassinIndex.toDouble() + (i * 0.5),
      ),
      phHistory: List.generate(7, (i) => 7.0 + (i * 0.1)),
      oxygenHistory: List.generate(7, (i) => 85.0 + (i * 1.0)),
    );

    return SizedBox(
      width: 300,
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bassin ${data.id}', style: theme.textTheme.titleLarge),
                Icon(
                  FontAwesomeIcons.circleCheck,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildMetrics(context, data),
            const SizedBox(height: 20),
            _buildChart(data),
          ],
        ),
      ),
    );
  }

  Widget _buildMetrics(BuildContext context, BassinData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _MetricItem(
          icon: FontAwesomeIcons.thermometer,
          value: '${data.temperature.toStringAsFixed(1)}°C',
          label: 'Temp.',
          color: Colors.orange,
        ),
        _MetricItem(
          icon: FontAwesomeIcons.droplet,
          value: 'pH ${data.phLevel.toStringAsFixed(1)}',
          label: 'pH',
          color: Theme.of(context).colorScheme.primary,
        ),
        _MetricItem(
          icon: FontAwesomeIcons.wind,
          value: '${data.oxygenLevel}%',
          label: 'O₂',
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildChart(BassinData data) {
    return SizedBox(
      height: 100,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            _createLineSeries(data.temperatureHistory, Colors.orange),
            _createLineSeries(data.phHistory, Colors.blue),
            _createLineSeries(
              data.oxygenHistory.map((e) => e / 10).toList(),
              Colors.green,
            ),
          ],
          minY: 0,
          maxY: 30,
        ),
      ),
    );
  }

  LineChartBarData _createLineSeries(List<double> data, Color color) {
    return LineChartBarData(
      spots: List.generate(data.length, (i) => FlSpot(i.toDouble(), data[i])),
      isCurved: true,
      color: color,
      barWidth: 2,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: true, color: color.withOpacity(0.1)),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _MetricItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const WeatherInfo({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, size: 24, color: theme.colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
