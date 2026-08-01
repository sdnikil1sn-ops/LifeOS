class QuoteService {

  static const List<String> quotes = [

    "Small progress is still progress.",

    "Discipline beats motivation.",

    "Success is built daily.",

    "Stay focused.",

    "Done is better than perfect.",

    "Dream big. Start now.",

    "Consistency wins."

  ];

  static String todayQuote() {

    final day = DateTime.now().day;

    return quotes[day % quotes.length];

  }

}