class Currency {
  final String? name;
  final double? buying;
  final double? selling;

  Currency({required this.name,required this.buying,required this.selling});

  factory Currency.fromJson(Map<String, dynamic> parsedJson) {
    return Currency(
      name: parsedJson['name'],
      buying: parsedJson['buying'],
      selling: parsedJson['selling'],
    );

  }
}