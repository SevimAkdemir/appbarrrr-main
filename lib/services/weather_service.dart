import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// API anahtarınızı buraya yazın
const String apiKey = 'e373ff6bb784bbdbb82816b0b72ae454';

// Şehir adı ve API URL'si
Future<Map<String, dynamic>> fetchWeather(String cityName) async {
  final response = await http.get(
    Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&cnt=16&units=metric&appid=$apiKey&lang=tr'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Hava durumu verisi alınamadı');
  }
}

class WeatherPage extends StatefulWidget {
  final String cityName;

  const WeatherPage({super.key, required this.cityName});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Map<String, dynamic>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = fetchWeather(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            children: [
              const TextSpan(
                  text: 'Hava Durumu - ',
                  style: TextStyle(color: Colors.white)),
              TextSpan(
                  text: widget.cityName,
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Map<String, dynamic>>(
          future: _weatherData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Hata: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              var weatherList = snapshot.data?['list'];
              if (weatherList == null) {
                return const Center(child: Text('Hava durumu verisi alınamadı'));
              }
              return ListView.builder(
                itemCount: weatherList.length,
                itemBuilder: (context, index) {
                  var weather = weatherList[index];
                  var dateTime =
                      DateTime.fromMillisecondsSinceEpoch(weather['dt'] * 1000);
                  var temperature = weather['main']['temp'];
                  var description = weather['weather'][0]['description'];
                  var icon = weather['weather'][0]['icon'];

                  return Card(
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    shadowColor: Colors.black.withOpacity(0.9),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://openweathermap.org/img/wn/$icon.png',
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        '${dateTime.toLocal().toString().substring(0, 16)} - $description',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.thermostat,
                              color: Colors.orange, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '$temperature°C',
                            style:
                                const TextStyle(fontSize: 14, color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('Veri yok'));
            }
          },
        ),
      ),
    );
  }
}
