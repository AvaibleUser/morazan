class SateliteInfo {
  final DateTime dateTime;
  final double temperature;
  final double humidity;
  final double radiation;
  final List<double> floorHumidity;
  final double windDirection;
  final double windVelocity;
  final double rainPrecipitation;

  const SateliteInfo({
    required this.dateTime,
    required this.temperature,
    required this.humidity,
    required this.radiation,
    required this.windDirection,
    required this.windVelocity,
    required this.rainPrecipitation,
    required this.floorHumidity,
  });

  factory SateliteInfo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      ({
        'fechahora': String dateTime,
        'temperatura': String temperature,
        'humedad': String humidity,
        'radiacion': String radiation,
        'suelo1': String floorHumidity1,
        'suelo2': String floorHumidity2,
        'suelo3': String floorHumidity3,
        'direccion': String windDirection,
        'velocidad': String windVelocity,
        'precipitacion': String rainPrecipitation,
      })
          when double.tryParse(temperature) != null &&
              double.tryParse(humidity) != null &&
              double.tryParse(radiation) != null &&
              double.tryParse(floorHumidity1) != null &&
              double.tryParse(floorHumidity2) != null &&
              double.tryParse(floorHumidity3) != null &&
              double.tryParse(windDirection) != null &&
              double.tryParse(windVelocity) != null &&
              double.tryParse(rainPrecipitation) != null =>
        SateliteInfo(
          dateTime: DateTime.parse(dateTime),
          temperature: double.parse(temperature),
          humidity: double.parse(humidity),
          radiation: double.parse(radiation),
          windDirection: double.parse(windDirection),
          windVelocity: double.parse(windVelocity),
          rainPrecipitation: double.parse(rainPrecipitation),
          floorHumidity: [
            double.parse(floorHumidity1),
            double.parse(floorHumidity2),
            double.parse(floorHumidity3),
          ],
        ),
      _ => throw const FormatException()
    };
  }

    DateTime getDateTime() {
    return dateTime;
  }
}
