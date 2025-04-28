import 'package:flutter/material.dart';

class ConfiguracaoAmbulanciaPage extends StatefulWidget {
  // Add a named 'key' parameter
  const ConfiguracaoAmbulanciaPage({super.key});

  @override
  ConfiguracaoAmbulanciaPageState createState() =>
      ConfiguracaoAmbulanciaPageState();
}

class ConfiguracaoAmbulanciaPageState
    extends State<ConfiguracaoAmbulanciaPage> {
  String? _selectedAmbulancia;
  List<Map<String, String>> ambulancias = [
    {
      "id": "1",
      "prefixo": "Ambulância A",
      "placa": "ABC-1234",
      "tipo": "Tipo 1",
    },
    {
      "id": "2",
      "prefixo": "Ambulância B",
      "placa": "XYZ-5678",
      "tipo": "Tipo 2",
    },
    // Add more ambulances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurar Ambulância Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selecione a ambulância que será associada a este dispositivo.',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
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
                  value: _selectedAmbulancia,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedAmbulancia = newValue;
                    });
                  },
                  items:
                      ambulancias.map((ambulancia) {
                        return DropdownMenuItem<String>(
                          value: ambulancia['id'],
                          child: Text(
                            ambulancia['prefixo'] != null
                                ? '${ambulancia['prefixo']} - ${ambulancia['placa']} (${ambulancia['tipo']})'
                                : '${ambulancia['placa']} (${ambulancia['tipo']})',
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Logic to save the selected ambulance
                    if (_selectedAmbulancia != null) {
                      // Execute the configuration logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Ambulância configurada com sucesso!'),
                        ),
                      );
                    } else {
                      // Error message if no ambulance is selected
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selecione uma ambulância.')),
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
