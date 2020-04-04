import '../notifications/flunt-notifiable.dart';
import 'contract.dart';

class ContractValidations extends FluntNotifiable {
  Contract isFalse(bool value, String property, String message) {
    if (!value) {
      addNotifications(FluntNotification(property, message));
    }
    return this;
  }

  Contract isTrue(bool value, String property, String message) =>
      isFalse(!value, property, message);

  Contract isGreaterThan(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isAfter((comparer as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value > comparer)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isGreaterOrEqualsThan(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isAfter((comparer as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value >= comparer)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isLowerThan(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isBefore((comparer as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value < comparer)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isLowerOrEqualsThan(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isBefore((comparer as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value <= comparer)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract areEquals(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).difference((comparer as DateTime)).inDays == 0)
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value == comparer)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract areNotEquals(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).difference((comparer as DateTime)).inDays != 0)
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value != comparer)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isBetween(dynamic value, dynamic from, dynamic into, String property,
      String message) {
    bool hasDatetime =
        ((value is DateTime) || (from is DateTime) || (into is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isAfter((from as DateTime)) ||
          (value as DateTime).isBefore((into as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if ((value >= from && value <= into))
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isNullOrNullable(dynamic value, String property, String message) {
    if (value == null || value.HasValue)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isNotNullOrEmpty(dynamic val, String property, String message) {
    if (val == null || val.isEmpty)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isNullOrEmpty(String val, String property, String message) {
    if (val == null || val.isEmpty)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract hasMinLen(String val, int min, String property, String message) {
    if (val == null || val.isEmpty || val.length < min)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract hasMaxLen(String val, int max, String property, String message) {
    if (val == null || val.isEmpty || val.length > max)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract hasLen(String val, int len, String property, String message) {
    if (val == null || val.isEmpty || val.length != len)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract contains(String val, String text, String property, String message) {
    if (!val.contains(text))
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isDigit(String text, String property, String message) {
    var numeric = RegExp('^\d+\$');

    if (!numeric.hasMatch(text)) {
      addNotifications(FluntNotification(property, message));
    }
    return this;
  }

  Contract hasMinLengthIfNotNullOrEmpty(
      String text, int min, String property, String message) {
    if (text != null && text.isNotEmpty && text.length < min)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract hasMaxLengthIfNotNullOrEmpty(
      String text, int max, String property, String message) {
    if (text != null && text.isNotEmpty && text.length > max)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract hasExactLengthIfNotNullOrEmpty(
      String text, int len, String property, String message) {
    if (text != null && text.isNotEmpty && text.length != len)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isEmail(String email, String property, String message) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isValidCPF(String cpf, String property, String message) {
    if (!_isValid(cpf)) addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isValidCNPJ(String cnpj, String property, String message) {
    if (!_isValidCNPJ(cnpj))
      addNotifications(FluntNotification(property, message));

    return this;
  }
}

bool _isValid(String cpf) {
  if (cpf == null) return false;

  var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  if (numeros.length != 11) return false;

  if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

  List<int> digitos =
      numeros.split('').map((String d) => int.parse(d)).toList();

  var calcDv1 = 0;
  for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
    calcDv1 += digitos[10 - i] * i;
  }
  calcDv1 %= 11;
  var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

  if (digitos[9] != dv1) return false;

  var calcDv2 = 0;
  for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
    calcDv2 += digitos[11 - i] * i;
  }
  calcDv2 %= 11;
  var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

  if (digitos[10] != dv2) return false;

  return true;
}

bool _isValidCNPJ(String cnpj) {
  if (cnpj == null) return false;

  var numeros = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

  if (numeros.length != 14) return false;

  if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

  List<int> digitos =
      numeros.split('').map((String d) => int.parse(d)).toList();

  var calcDv1 = 0;
  var j = 0;
  for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
    calcDv1 += digitos[j++] * i;
  }
  calcDv1 %= 11;
  var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

  if (digitos[12] != dv1) return false;

  var calcDv2 = 0;
  j = 0;
  for (var i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
    calcDv2 += digitos[j++] * i;
  }
  calcDv2 %= 11;
  var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

  if (digitos[13] != dv2) return false;

  return true;
}
