# fluent_dart

Flunt Dart is based on [Andre Baltieri](https://github.com/andrebaltieri) [Flunt](https://github.com/andrebaltieri/flunt) for use Notifications Pattern with your entities.

## Instalação

Abra o pubspec.yaml do seu Projeto e digite:

```yaml
dependencies:
    fluent_dart:
```
ou a partir do repositório:

```yaml
dependencies:
    fluent_dart:
        git:
            url: https://github.com/Quiese/fluent_dart.git
```

## Exemplos

- Create file user-model.dart

```dart
import 'package:fluent_dart/notifications/flunt-notifiable.dart';
import 'package:fluent_dart/validations/contract.dart';

class User extends FluntNotifiable {
  String name;
  String email;

  User({name, email}) {
    if (!name.contains('Usuário'))
      addNotifications(FluntNotification('Name', 'Nome deve ser Usuário!'));

    if (!name.contains('Usuário'))
      addNotifications(['Name', 'Nome deve ser Usuário!']);

    addNotifications(
      Contract()
          .HasMinLen(name, 10, 'name', 'Nome deve ter no mínimo 10 caracteres!')
          .IsNotNullOrEmpty(email, 'email', 'Email deve ser preenchido!'),
    );
  }
}
```

- Create file main.dart

```dart
import 'user-model.dart';

void main() {
  var user = User(name: 'Nome');

  //show notifications errors
  user.Notifications.forEach((f) => print(f.Message));

  print('\n${user.Notifications.length} Erros de validação');

  user = User(
    name: 'Nome do Usuário',
    email: 'user@user.com.br',
  );

  user.Notifications.forEach((f) => print(f.Message));
  
  print('${user.Notifications.length} Erros de validação');
}
```

- Run dart main.dart;
