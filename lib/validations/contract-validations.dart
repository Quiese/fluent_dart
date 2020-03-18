import '../notifications/flunt-notifiable.dart';
import 'contract.dart';

class ContractValidations extends FluntNotifiable {
  Contract isFalse(bool value, String property, String message) {
    if (value) {
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
      if ((value as DateTime).isBefore((comparer as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value <= comparer)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isGreaterOrEqualsThan(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isBefore((comparer as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value < comparer) addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isLowerThan(
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

  Contract isLowerOrEqualsThan(
      dynamic value, dynamic comparer, String property, String message) {
    bool hasDatetime = ((value is DateTime) || (comparer is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isAfter((comparer as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (value > comparer) addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract areEquals(
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

  Contract areNotEquals(
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

  Contract isBetween(dynamic value, dynamic from, dynamic into, String property,
      String message) {
    bool hasDatetime =
        ((value is DateTime) || (from is DateTime) || (into is DateTime));

    if (hasDatetime) {
      if ((value as DateTime).isBefore((from as DateTime)) ||
          (value as DateTime).isAfter((into as DateTime)))
        addNotifications(FluntNotification(property, message));
      return this;
    }

    if (!(value >= from && value <= into))
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isNullOrNullable(dynamic value, String property, String message) {
    if (value == null || !value.HasValue)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isNotNullOrEmpty(String val, String property, String message) {
    if (val == null || val.isEmpty)
      addNotifications(FluntNotification(property, message));

    return this;
  }

  Contract isNullOrEmpty(String val, String property, String message) {
    if (val != null || val.isNotEmpty)
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
}