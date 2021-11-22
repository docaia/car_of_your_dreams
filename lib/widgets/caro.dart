class Caro {
  String manu;
  String model;
  String year;
  String rate;

  Caro({required this.manu, required this.model, required this.year, required this.rate});

  factory Caro.fromJson(Map<String, dynamic> json) {
    return Caro(
      manu: json['Manufacturer'] as String,
      model: json['Model'] as String,
      year: json['Year'] as String,
      rate: json['Rate'] as String
    );
  }
}