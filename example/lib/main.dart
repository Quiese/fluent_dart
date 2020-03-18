import 'models/user-model.dart';

void main() {
  var user = User(name: 'Nome');

  //show notifications errors
  user.notifications.forEach((f) => print(f.message));

  print('\n${user.notifications.length} Erros de validação');

  user = User(
    name: 'Nome do Usuário',
    email: 'user@user.com.br',
  );

  user.notifications.forEach((f) => print(f.message));

  print('${user.notifications.length} Erros de validação');
}
