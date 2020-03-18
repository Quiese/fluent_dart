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
          .hasMinLen(name, 10, 'name', 'Nome deve ter no mínimo 10 caracteres!')
          .isNotNullOrEmpty(email, 'email', 'Email deve ser preenchido!'),
    );
  }
}
