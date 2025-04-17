class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    // Format the date to a string in the format 'dd/MM/yyyy HH:mm'
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }

  static String formatCurrency(double? amount) {
    amount ??= 0.0;
    // Format the amount to a string with two decimal places
    return '\$${amount.toStringAsFixed(2)}';
  }

  static String formatPhoneNumber(String? phoneNumber) {
    phoneNumber ??= '';
    // Format the phone number to a standard format (e.g., (12) 34567-8901 for mobile or (12) 3456-7890 landline)
    if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 7)}-${phoneNumber.substring(7)}';
    } else if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)}-${phoneNumber.substring(6)}';
    } else {
      return phoneNumber;
    }
  }

  
}
