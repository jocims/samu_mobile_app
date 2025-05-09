import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:samu_mobile_app/features/authentication/screens/login/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? ambulanceData;

  @override
  void initState() {
    super.initState();
    _loadAmbulanceData();
  }

  Future<void> _loadAmbulanceData() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('selected_ambulancia_id');

    if (id != null) {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/api/ambulancias/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        setState(() {
          ambulanceData = json.decode(response.body);
          print('Ambulance ID: $id');
          print('Requesting: http://10.0.2.2:5000/api/ambulancias/$id');
        });
      } else {
        print('Failed to load ambulance details: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<_DashboardItem> dashboardItems = [
      _DashboardItem(
        title: 'Emergency Response',
        icon: Icons.health_and_safety,
        onTap: () {},
      ),
      _DashboardItem(
        title: 'Medical Supplies',
        icon: Icons.medical_services,
        onTap: () {},
      ),
      _DashboardItem(
        title: 'Location Tracker',
        icon: Icons.location_on,
        onTap: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Get.offAll(() => const LoginScreen());
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (ambulanceData != null)
              Card(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.local_hospital,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text('Ambulância: ${ambulanceData!['placa']}'),
                  subtitle: Text(
                    'Tipo: ${ambulanceData!['tipo']} • Status: ${ambulanceData!['status']}',
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: dashboardItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = dashboardItems[index];
                  return InkWell(
                    onTap: item.onTap,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            size: 48,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _DashboardItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
