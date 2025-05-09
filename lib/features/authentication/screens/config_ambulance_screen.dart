import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/ambulancia.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:samu_mobile_app/features/authentication/screens/dashboard.dart';

class ConfigAmbulanceScreen extends StatefulWidget {
  const ConfigAmbulanceScreen({super.key});

  @override
  ConfigAmbulanceScreenState createState() => ConfigAmbulanceScreenState();
}

class ConfigAmbulanceScreenState extends State<ConfigAmbulanceScreen> {
  String? _selectedAmbulancia;
  List<Map<String, String>> ambulancias = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAmbulancias();
  }

  Future<void> fetchAmbulancias() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null) {
        print('No token found. User might not be logged in.');
        setState(() => isLoading = false);
        return;
      }

      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/api/ambulancias'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          ambulancias =
              data
                  .map<Map<String, String>>(
                    (json) => {
                      "id": json["id"].toString(),
                      "prefixo": json["prefixo"] ?? "",
                      "placa": json["placa"] ?? "",
                      "tipo": json["tipo"] ?? "",
                    },
                  )
                  .toList();
          isLoading = false;
        });
      } else {
        print('Erro ao buscar ambulâncias: ${response.statusCode}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Erro na requisição: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurar Ambulância API')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selecione a ambulância que será associada a este dispositivo.',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Ambulância',
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          value:
                              ambulancias.any(
                                    (a) => a["id"] == _selectedAmbulancia,
                                  )
                                  ? _selectedAmbulancia
                                  : null,
                          onChanged:
                              ambulancias.isNotEmpty
                                  ? (String? newValue) {
                                    setState(() {
                                      _selectedAmbulancia = newValue;
                                    });
                                  }
                                  : null,
                          items:
                              ambulancias.isNotEmpty
                                  ? ambulancias.map((ambulancia) {
                                    return DropdownMenuItem<String>(
                                      value: ambulancia['id'],
                                      child: Text(
                                        '${ambulancia['prefixo']} - ${ambulancia['placa']} (${ambulancia['tipo']})',
                                      ),
                                    );
                                  }).toList()
                                  : [
                                    DropdownMenuItem(
                                      value: null,
                                      child: Text(
                                        'Nenhuma ambulância disponível',
                                      ),
                                    ),
                                  ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_selectedAmbulancia != null) {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                'ambulancia_id',
                                _selectedAmbulancia!,
                              );

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Ambulância configurada com sucesso!',
                                    ),
                                  ),
                                );
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString(
                                  'selected_ambulancia_id',
                                  _selectedAmbulancia!,
                                );
                                Get.offAll(() => const DashboardScreen());
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Selecione uma ambulância.'),
                                ),
                              );
                            }
                          },
                          icon: Icon(Icons.check),
                          label: Text('Confirmar'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            textStyle: TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: Size(double.infinity, 0),
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
