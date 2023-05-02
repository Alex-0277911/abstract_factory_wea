// Цей патерн передбачає, що ви маєте кілька сімейств продуктів,
// які знаходяться в окремих ієрархіях класів (Button/Checkbox).
// Продукти одного сімейства повинні мати спільний інтерфейс.

abstract class Button {
  void paint();
}

// Cімейства продуктів мають однакові варіації (macOS/Windows).
class WinButton implements Button {
  @override
  void paint() {
// Відобразити кнопку в стилі Windows.
    print('paint WinButton');
  }
}

class MacButton implements Button {
  @override
  void paint() {
// Відобразити кнопку в стилі macOS.
    print('paint MacButton');
  }
}

abstract class Checkbox {
  void paint();
}

class WinCheckbox implements Checkbox {
  @override
  void paint() {
// Відобразити чекбокс в стилі Windows.
    print('paint WinCheckbox');
  }
}

class MacCheckbox implements Checkbox {
  @override
  void paint() {
// Відобразити чекбокс в стилі macOS.
    print('paint MacCheckbox');
  }
}

// Абстрактна фабрика знає про всі абстрактні типи продуктів.
abstract class GUIFactory {
  Button createButton();
  Checkbox createCheckbox();
}

// Кожна конкретна фабрика знає лише про продукти своєї варіації
// і створює лише їх.
class WinFactory implements GUIFactory {
  @override
  Button createButton() {
    print('WinFactory createButton');
    return WinButton();
  }

  @override
  Checkbox createCheckbox() {
    print('WinFactory createCheckbox');
    return WinCheckbox();
  }
}

// Незважаючи на те, що фабрики оперують конкретними класами,
// їхні методи повертають абстрактні типи продуктів. Завдяки
// цьому фабрики можна заміняти одну на іншу, не змінюючи
// клієнтського коду.
class MacFactory implements GUIFactory {
  @override
  Button createButton() {
    print('MacFactory createButton');
    return MacButton();
  }

  @override
  Checkbox createCheckbox() {
    print('MacFactory createCheckbox');
    return MacCheckbox();
  }
}

// Для коду, який використовує фабрику, не важливо, з якою
// конкретно фабрикою він працює. Всі отримувачі продуктів
// працюють з ними через загальні інтерфейси.
class Application {
  GUIFactory factory;
  late Button button;
  late Checkbox checkbox;

  Application(this.factory);

  void createUI() {
    button = factory.createButton();
    checkbox = factory.createCheckbox();
  }

  void paint() {
    button.paint();
    checkbox.paint();
  }
}

// Програма вибирає тип конкретної фабрики й створює її
// динамічно, виходячи з конфігурації або оточення.
void main() {
  var config = 'Mac';

  GUIFactory factory;

  if (config == 'Windows') {
    factory = WinFactory();
  } else if (config == 'Mac') {
    factory = MacFactory();
  } else {
    throw Exception('Error! Unknown operating system.');
  }

  var app = Application(factory);
  app.createUI();
  app.paint();
}
