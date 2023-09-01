/*
{
  },
  "weather": [
    {
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48,
    "temp_min": 297.56,
    "temp_max": 300.05,
    "humidity": 64,
  },
  "name": "Zocca",
}                                              
*/ 

class WeatherInfo{
  final String description;
  final String icon;

  WeatherInfo({required this.description,required this.icon});

  factory WeatherInfo.fromJson(Map<String,dynamic>json){
    final description =json['description'];
    final icon =json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo{
  final double temperature;
  final double min_temp;
  final double max_temp;
  final int pressure;
  final int humidity;
  TemperatureInfo({required this.temperature, required this.humidity, required this.pressure, required this.min_temp, required this.max_temp});

  factory TemperatureInfo.fromJson(Map<String,dynamic>json){
    final temperature = json['temp'];
    final min_temp =json['temp_min'];
    final max_temp = json['temp_max'];
    final humidity = json['humidity'];
    final pressure =json['pressure'];
    return TemperatureInfo(temperature: temperature, humidity: humidity, pressure: pressure, max_temp: max_temp, min_temp: min_temp);
  }
}


class WeatherResponse{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl{
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({required this.cityName, required this.tempInfo, required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String,dynamic> json){
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson =json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo:weatherInfo);
  }
}