// "Abstract Factory" на мові Dart для створення погодного додатку:

// Абстрактний клас фабрики для отримання погодних даних,
// який має один абстрактний метод getWeather().

abstract class WeatherFactory {
  factory WeatherFactory(String type) {
    switch (type) {
      case 'openweathermap':
        return OpenWeatherMapFactory();
      case 'weatherbit':
        return WeatherBitFactory();
      default:
        return OpenWeatherMapFactory();
    }
  }

  Future<WeatherData> getWeather(String city);
}

// Конкретна реалізація фабрики для отримання погодних даних з OpenWeatherMap
class OpenWeatherMapFactory implements WeatherFactory {
  @override
  //
  Future<WeatherData> getWeather(String city) async {
    // імітуємо отримання даних з сервісу OpenWeatherMap
    return WeatherData(
      city: city,
      temperature: 12.34,
      windSpeed: 45.5,
      description:
          'OpenWeatherMap При такому вітрі дощ падає горизонтально... Краще побудьте вдома',
    );
  }
}

// Конкретна реалізація фабрики для отримання погодних даних з WeatherBit
class WeatherBitFactory implements WeatherFactory {
  @override
  Future<WeatherData> getWeather(String city) async {
    // імітуємо отримання даних з сервісу OpenWeatherMap
    return WeatherData(
      city: city,
      temperature: 12.34,
      windSpeed: 0.5,
      description: 'WeatherBit Штіль... можна й погуляти',
    );
  }
}

// Клас для зберігання погодних даних
class WeatherData {
  final String? city;
  final double? temperature;
  final double? windSpeed;
  final String? description;

  WeatherData({this.city, this.temperature, this.windSpeed, this.description});
}

// Головна функція
void main() async {
  // створюється фабрика factory типу WeatherFactory з типом 'openweathermap'

  // WeatherFactory factory = WeatherFactory('openweathermap');

  // створюється фабрика factory типу WeatherFactory з типом 'weatherbit'

  WeatherFactory factory = WeatherFactory('weatherbit');

  // викликаємо getWeather через створену фабрику
  WeatherData weatherData = await factory.getWeather('Odessa');

  // результат
  print('City: ${weatherData.city}');
  print('Temperature: ${weatherData.temperature}');
  print('Wind speed: ${weatherData.windSpeed}');
  print('Description: ${weatherData.description}');
}
