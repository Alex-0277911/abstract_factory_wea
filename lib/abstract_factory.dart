// Абстрактні класи для створення віджетів

abstract class Button {
  String getText();
}

abstract class Label {
  String getText();
}

// Конкретні класи віджетів

class UkrainianButton implements Button {
  @override
  String getText() {
    return "Погода";
  }
}

class UkrainianLabel implements Label {
  @override
  String getText() {
    return "Температура:";
  }
}

// Абстрактна фабрика, яка визначає методи створення віджетів

abstract class WeatherWidgetFactory {
  Button createButton();
  Label createLabel();
}

// Конкретна фабрика, яка створює віджети української локалі

class UkrainianWeatherWidgetFactory implements WeatherWidgetFactory {
  @override
  Button createButton() {
    return UkrainianButton();
  }

  @override
  Label createLabel() {
    return UkrainianLabel();
  }
}

// Клас, який використовує фабрику для створення віджетів

class WeatherApp {
  final WeatherWidgetFactory _factory;

  WeatherApp(this._factory);

  void displayWeather() {
    Button button = _factory.createButton();
    Label label = _factory.createLabel();

    print(button.getText());
    print(label.getText());
  }
}

// Використання патерну "Абстрактна фабрика"

void main() {
  // Створення фабрики для української локалі
  WeatherWidgetFactory factory = UkrainianWeatherWidgetFactory();

  // Створення додатку з використанням української фабрики
  WeatherApp app = WeatherApp(factory);

  // Відображення погоди з використанням українських віджетів
  app.displayWeather();
}


// дописати ще одну фабрику та кнопки і лейбл до неї