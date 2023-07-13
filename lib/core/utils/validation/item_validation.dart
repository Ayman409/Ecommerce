abstract class ItemValidation {
  static String? validateItemKind(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أختر نوع الإضافة';
    }
    return null;
  }

  static String? validateItemInternalCode(String? value) {
    if (value!.isEmpty) {
      return 'من فضلك أدخل كود الصنف التعريفي الخاص بك';
    }
    return null;
  }

  static String? validateItemName(String? value) {
    if (value!.isEmpty) {
      return 'من فضلك أدخل أسم الصنف';
    }
    return null;
  }

  static String? validateTaxRate(String? value) {
    if (value!.isEmpty) {
      return 'من فضلك أدخل نسبة الضريبة';
    }
    if (double.tryParse(value) == null ||
        double.parse(value) > 100 ||
        double.parse(value) < 0) {
      return 'نسبة الضريبة يجب أن تكون رقم من ٠ ل ١٠٠';
    }
    return null;
  }

  static String? validateTaxSubtype(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أختر نوع الضريبة الفرعية';
    }
    return null;
  }

  static String? validateItemPrice(String? value) {
    if (value!.isEmpty) {
      return 'من فضلك أدخل السعر';
    }
    if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'السعر يجب أن يكون رقم أكبر من ٠';
    }
    return null;
  }

  static String? validateItemDescription(String? value) {
    if (value!.isEmpty) {
      return 'من فضلك أدخل وصف الصنف';
    }
    return null;
  }

  static String? validateItemTaxCode(String? value) {
    if (value!.isEmpty) {
      return 'من فضلك أدخل كود الصنف';
    }
    return null;
  }

  static String? validateTaxType(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أختر نوع الضريبة';
    }
    return null;
  }

  static String? validateItemCategory(value) {
    if (value == null || value.title.isEmpty) {
      return 'من فضلك أختر الفئة الخاصة بالصنف';
    }
    return null;
  }

  static String? validateItemUnit(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أختر نوع الوحدة';
    }
    return null;
  }

  static String? validateItemType(value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك أختر نوع الضرائيبي الخاص بالصنف';
    }
    return null;
  }
}
