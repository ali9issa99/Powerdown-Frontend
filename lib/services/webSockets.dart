import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeControlPage extends StatefulWidget {
  @override
  _HomeControlPageState createState() => _HomeControlPageState();
}

class _HomeControlPageState extends State<HomeControlPage> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://10.0.2.2:8081'), // Replace with your backend IP
  );

  String sensorData = "No data yet";

  @override
  void initState() {
    super.initState();
    // Send an identification message as a Flutter client
    _channel.sink.add(jsonEncode({
      'type': 'identify',
      'client': 'flutter',
    }));
  }

  void _turnApplianceOn() {
    _channel.sink.add(jsonEncode({
      'type': 'controlAppliance',
      'command': 'TURN_ON',
    }));
  }

  void _turnApplianceOff() {
    _channel.sink.add(jsonEncode({
      'type': 'controlAppliance',
      'command': 'TURN_OFF',
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Home Control'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: _turnApplianceOn,
            child: Text('Turn On Appliances'),
          ),
          ElevatedButton(
            onPressed: _turnApplianceOff,
            child: Text('Turn Off Appliances'),
          ),
          StreamBuilder(
            stream: _channel.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Waiting for sensor data..."),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                final data = jsonDecode(snapshot.data as String);
                if (data['type'] == 'sensorData') {
                  sensorData =
                      "LED Current: ${data['payload']['ledCurrent']} A\n"
                      "Motor Current: ${data['payload']['motorCurrent']} A";
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(sensorData),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("No data yet"),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
