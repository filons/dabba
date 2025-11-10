import 'package:flutter/material.dart';
import 'package:dabba/pages/alertes.dart';
import 'package:dabba/pages/stocks.dart';
import 'package:dabba/pages/assistant.dart';
import 'package:dabba/pages/communaute.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  final String titre;
  const MyHomePage({super.key, required this.titre});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AccueilContent(),
    const MyAlertesPage(),
    const MyAssistantPage(),
    const MyStocksPage(),
    const MyCommunautePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
          title: Text(
            widget.titre,
            style: const TextStyle(
              fontFamily: "roboto",
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
            ),
          ),
          leading: Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue.shade600,
                  size: 18,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(Icons.search_rounded, color: Colors.grey.shade600),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Rechercher...',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue.shade600,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Chercher'),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Accueil'),
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.warning),
                title: const Text('Alertes'),
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.inventory),
                title: const Text('Stocks'),
                onTap: () {
                  setState(() => _selectedIndex = 2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text('Assistant'),
                onTap: () {
                  setState(() => _selectedIndex = 3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Communauté'),
                onTap: () {
                  setState(() => _selectedIndex = 4);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 96,
          child: Stack(
            children: [
              // Painted deformed background with center notch
              Positioned.fill(
                child: CustomPaint(
                  painter: _DeformedBarPainter(
                    color: Colors.blue,
                    notchRadius: _selectedIndex == 2 ? 36 : 30,
                  ),
                ),
              ),
              // Actual nav bar on top, transparent to reveal shape
              Positioned.fill(
                child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white.withOpacity(0.6),
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Accueil',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.warning),
                      label: 'Alertes',
                    ),
                    BottomNavigationBarItem(
                      label: 'Assistant',
                      icon: _AssistantBadge(selected: _selectedIndex == 2),
                      activeIcon: _AssistantBadge(selected: true),
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.inventory),
                      label: 'Stocks',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.group),
                      label: 'Communauté',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccueilContent extends StatelessWidget {
  const AccueilContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenue, Eric 👋',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vue d\'ensemble des bassins',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),
          const _BassinCarousel(),
          const SizedBox(height: 20),
          const WeatherWidget(),
        ],
      ),
    );
  }
}

// Anciennes sections (fonctionnalités/astuces) supprimées car non utilisées sur l'accueil

class BassinCard extends StatelessWidget {
  final int bassinNumber;
  final int temperature;
  final int poissonsCount;
  final double phLevel;
  final double oxygenLevel;

  const BassinCard({
    super.key,
    required this.bassinNumber,
    required this.temperature,
    required this.poissonsCount,
    required this.phLevel,
    required this.oxygenLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bassin $bassinNumber',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Divider(),
            const SizedBox(height: 8),
            InfoRow(icon: Icons.thermostat, text: '$temperature°C'),
            InfoRow(icon: Icons.face, text: '$poissonsCount poissons'),
            InfoRow(icon: Icons.water_drop, text: 'pH: $phLevel'),
            InfoRow(icon: Icons.air, text: 'O₂: $oxygenLevel%'),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Météo locale',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                WeatherInfo(
                  icon: Icons.wb_sunny,
                  temperature: '28°C',
                  condition: 'Ensoleillé',
                ),
                WeatherInfo(
                  icon: Icons.water_drop,
                  temperature: '75%',
                  condition: 'Humidité',
                ),
                WeatherInfo(
                  icon: Icons.air,
                  temperature: '10 km/h',
                  condition: 'Vent',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BassinData {
  final int bassinNumber;
  final int temperature;
  final int poissonsCount;
  final double phLevel;
  final int oxygenLevel;

  _BassinData({
    required this.bassinNumber,
    required this.temperature,
    required this.poissonsCount,
    required this.phLevel,
    required this.oxygenLevel,
  });
}

class _BassinCarousel extends StatelessWidget {
  const _BassinCarousel();

  @override
  Widget build(BuildContext context) {
    final List<_BassinData> data = List.generate(6, (index) {
      return _BassinData(
        bassinNumber: index + 1,
        temperature: 25 + index,
        poissonsCount: 100 + (index * 40),
        phLevel: 7.0 + (index * 0.1),
        oxygenLevel: 85 + (index * 2),
      );
    });

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final b = data[index];
        return _BassinTile(data: b);
      },
    );
  }
}

class _BassinTile extends StatelessWidget {
  final _BassinData data;
  const _BassinTile({required this.data});

  @override
  Widget build(BuildContext context) {
    // Données simulées pour les graphiques
    final List<double> temperatureHistory = [
      25,
      26,
      25.5,
      25.8,
      26.2,
      25.9,
      data.temperature.toDouble(),
    ];
    final List<double> phHistory = [7.0, 7.1, 7.0, 6.9, 7.0, 7.2, data.phLevel];
    final List<double> oxygenHistory = [
      85,
      86,
      84,
      85,
      87,
      86,
      data.oxygenLevel.toDouble(),
    ];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image du bassin
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://example.com/bassin${data.bassinNumber}.jpg',
                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Container(
                          color: Colors.blue.shade50,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          color: Colors.blue.shade50,
                          child: const Icon(
                            Icons.water,
                            size: 50,
                            color: Colors.blue,
                          ),
                        ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Bassin ${data.bassinNumber}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Informations et graphiques
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Statistiques principales
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard(
                      Icons.thermostat,
                      '${data.temperature}°C',
                      'Temp.',
                      Colors.orange,
                    ),
                    _buildStatCard(
                      Icons.water_drop,
                      'pH ${data.phLevel.toStringAsFixed(1)}',
                      'pH',
                      Colors.blue,
                    ),
                    _buildStatCard(
                      Icons.air,
                      '${data.oxygenLevel}%',
                      'O₂',
                      Colors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Nombre de poissons
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.fish,
                        color: Colors.blue,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${data.poissonsCount} poissons',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Graphique
                SizedBox(
                  height: 90,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        // Température
                        LineChartBarData(
                          spots: List.generate(
                            temperatureHistory.length,
                            (i) => FlSpot(
                              i.toDouble(),
                              temperatureHistory[i] - 20,
                            ),
                          ),
                          isCurved: true,
                          color: Colors.orange,
                          barWidth: 2,
                          dotData: FlDotData(show: false),
                        ),
                        // pH
                        LineChartBarData(
                          spots: List.generate(
                            phHistory.length,
                            (i) => FlSpot(i.toDouble(), phHistory[i]),
                          ),
                          isCurved: true,
                          color: Colors.blue,
                          barWidth: 2,
                          dotData: FlDotData(show: false),
                        ),
                        // Oxygène
                        LineChartBarData(
                          spots: List.generate(
                            oxygenHistory.length,
                            (i) =>
                                FlSpot(i.toDouble(), oxygenHistory[i] / 10 - 4),
                          ),
                          isCurved: true,
                          color: Colors.green,
                          barWidth: 2,
                          dotData: FlDotData(show: false),
                        ),
                      ],
                      minY: 0,
                      maxY: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

class _AssistantBadge extends StatelessWidget {
  final bool selected;
  const _AssistantBadge({required this.selected});

  @override
  Widget build(BuildContext context) {
    final double size = selected ? 58 : 48;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(selected ? 0.28 : 0.2),
            blurRadius: selected ? 18 : 12,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Icon(
        Icons.support_agent_rounded,
        color: Colors.blue,
        size: selected ? 30 : 26,
      ),
    );
  }
}

class _DeformedBarPainter extends CustomPainter {
  final Color color;
  final double notchRadius;
  const _DeformedBarPainter({required this.color, required this.notchRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final double barHeight = 70;
    final Rect barRect = Rect.fromLTWH(
      0,
      size.height - barHeight,
      size.width,
      barHeight,
    );

    final Path path = Path();
    final double radius = 16;
    final double top = barRect.top;
    final double bottom = barRect.bottom;
    final double left = barRect.left;
    final double right = barRect.right;

    // Rounded rectangle
    path.moveTo(left + radius, top);
    path.lineTo(right - radius, top);
    path.quadraticBezierTo(right, top, right, top + radius);
    path.lineTo(right, bottom - radius);
    path.quadraticBezierTo(right, bottom, right - radius, bottom);
    path.lineTo(left + radius, bottom);
    path.quadraticBezierTo(left, bottom, left, bottom - radius);
    path.lineTo(left, top + radius);
    path.quadraticBezierTo(left, top, left + radius, top);

    // Concave notch at center top
    final double centerX = size.width / 2;
    final double notchWidth = notchRadius * 2.4;
    final double notchDepth = notchRadius * 1.2;
    final double notchStartX = centerX - notchWidth / 2;
    final double notchEndX = centerX + notchWidth / 2;

    // Carve out a smooth concave dip
    final Path notch =
        Path()
          ..moveTo(notchStartX, top)
          ..cubicTo(
            centerX - notchWidth * 0.25,
            top,
            centerX - notchWidth * 0.35,
            top + notchDepth,
            centerX,
            top + notchDepth,
          )
          ..cubicTo(
            centerX + notchWidth * 0.35,
            top + notchDepth,
            centerX + notchWidth * 0.25,
            top,
            notchEndX,
            top,
          )
          ..lineTo(notchStartX, top)
          ..close();

    // Combine: subtract notch from the rounded rectangle
    final Path finalPath = Path.combine(PathOperation.difference, path, notch);
    canvas.drawPath(finalPath, paint);
  }

  @override
  bool shouldRepaint(covariant _DeformedBarPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.notchRadius != notchRadius;
  }
}

class WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String temperature;
  final String condition;

  const WeatherInfo({
    super.key,
    required this.icon,
    required this.temperature,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          temperature,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          condition,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
