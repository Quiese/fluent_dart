import '../notifications/flunt-notifiable.dart';
import 'contract-validations.dart';

class Contract extends ContractValidations {
  Contract requires() => this;

  Contract join(List<FluntNotifiable> itens) {
    if (itens != null) {
      itens.forEach(
        (f) {
          if (f.invalid) {
            addNotifications(f.notifications);
          }
        },
      );
    }
    return this;
  }
}
