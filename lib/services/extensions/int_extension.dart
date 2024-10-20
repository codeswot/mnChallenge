import 'package:intl/intl.dart';

extension IntExt on int {
  String formatWithSeparator({String separator = ','}) {
    // Use the replaceAll method to customize the separator
    NumberFormat numberFormat = NumberFormat('#,###');
    String formattedNumber = numberFormat.format(this);

    // Replace the default comma separator with the custom one
    if (separator != ',') {
      formattedNumber = formattedNumber.replaceAll(',', separator);
    }

    return formattedNumber;
  }
}
