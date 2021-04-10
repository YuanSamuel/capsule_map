class StringHelper {
  static dateToString(DateTime date) {
    return date.month.toString() +
        '/' +
        date.day.toString() +
        '/' +
        date.year.toString().substring(2);
  }
}
