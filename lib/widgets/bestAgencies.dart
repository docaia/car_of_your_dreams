class BestAgencies{
  BestAgencies({required this.Man, required this.Agency, required this.Rate});
  final String Man;
  final String Agency;
  final dynamic Rate;


  factory BestAgencies.fromJson(Map<String, dynamic> json) {
    return BestAgencies(
      Man: json['Manufacturer'],
      Agency: json['Agency'],
      Rate: json['Agency_Rating'],
    );
  }

}